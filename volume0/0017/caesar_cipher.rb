#!/usr/bin/ruby
=begin
AOJ問題 volume0-0017 シーザー暗号
文字のアルファベットを、何文字かずらしたアルファベットに置き換えて作られる暗号をシーザー暗号と言います。
たとえば、アルファベットを1文字ずらし、aをbに、bをcに、yをzに、zをaに置き換えることによって、文を暗号化することができます。
その場合、
this is a pen
という文は
uijt jt b qfo
と暗号化されます。
シーザー暗号によって暗号化されたデータを入力として受け取り、復号されたデータを出力するプログラムを作成してください。
何文字ずらしたかはひみつですし、各データによって異なります。
ただし、暗号化する前のデータは the,this,that という単語のいずれかを含む英語の文章ですので、
それを手がかりに復号して下さい。
暗号化されたデータに含まれる文字は、アルファベットの小文字、ピリオド、空白、改行のみです。
暗号化にあたり、アルファベット以外の文字は置き換えられていません。
暗号化されたデータは空白、ピリオド、改行を含めて80文字以下です。
[input]
複数のデータセットが与えられます。各データセットに暗号化された文字列が1行に与えられます。入力の最後まで処理してください。
[output]
各データセットに対して、複合した文を1行に出力してください。
[sample input]
xlmw mw xli tmgxyvi xlex m xsso mr xli xvmt.
[sample output]
this is the picture that i took in the trip.
=end

# 指針：効率の良い復号方法を考える
# 暗号文字列を「隣のアルファベットといくつ離れているか」で数値化

class String
  def word_diff
    ret = []
    self.size.times do |n|
      next if n == 0
      ret << self[n - 1].ord - self[n].ord
    end
    return ret
  end

  def get_key
    return case self.size
    when 2 then self[0].ord - "i".ord
    when 4 then self[0].ord - "t".ord
    end
  end
end

class Array
  def target_word?
    return case self.size
    when 1 then self == [-11]
    when 3 then self == [12, -1, -10] || self == [12, 7, -19]
    else false
    end
  end
end

file = File.readlines("./input.txt").map(&:chomp)

file.each do |line|
  cipher_key = 0
  words = line.split(" ")

  words.each do |word|
    if word.word_diff.target_word? then
      cipher_key = word.get_key
      break
    end
  end

  line.each_char {|c|
    case c
    when " " then print c
    when "." then print c
    else print c.ord.-(cipher_key).chr
    end
  }
  puts
end
