#!/usr/bin/ruby
=begin
AOJ問題 volume0-0040 アフィン暗号
簡単な暗号法の一つに、アフィン暗号というものがあります。
まず、アルファベット a～z を a = 0, b = 1, c = 2,..., x = 23, y = 24, z = 25 と 0～25 の数字に置き換えます。
そして、以下の式で、原文のアルファベットを置換します。
F(x) = (a * x + b) mod 26

ただし、mod 26 は 26 で割った余りを表します。
たとえば、a = 3; b = 2 のとき、アルファベットの‘a’(=0) は、F(0) = (3・0 + 2) mod 26 = 2 で‘c’に、
アルファベットの‘n’(=13) は F(13) = (3・13 + 2) mod 26 = 15 で‘p’ に置換されます。
このとき、xに対する F(x) が必ず 1 対 １で対応付けられるように、aとbは慎重に選ばれているものとします（aと26が互いに素であることが条件）。
a = 4、b = 7 のときのように、F(a) = 7 , F(n) = 7 と、‘a’ も‘n’ も同じ‘h’ に置換されるようなことはありません。
また、アルファベット以外の文字は置換されません。
暗号化された文字列を元の文章に復号したものを出力して終了するプログラムを作成してください。
元の文章には、キーワードとして
that
this
のいずれかが必ず含まれていることとします。
[input]
複数のデータセットが与えられます。一行目にデータセット数 n が与えられます。
続いてｎ行のデータが与えられます。各データセットに半角の英小文字と空白からなる256 文字以内の暗号化された文章が１行に与えられます。
[output]
各データセットに対して、復号した元の文章を１行に出力して下さい。
[sample input]
1
y eazqyp pnop pngtg ye obmpngt xmybp mr lygw
[sample output]
i submit that there is another point of view
=end

class String
  def to_cipher_int
    self.ord - "a".ord
  end
end

class Fixnum
  def to_cipher_char
    (self + "a".ord).chr
  end
end

class AffineCipher
  def initialize(input)
    @input = input

    @input.split(" ").each do |word|
      keys = self.decideCipherKey(word)
      if keys != false then
        @akey = keys[0]
        @bkey = keys[1]
        break
      end
    end
  end

  attr_accessor :input, :akey, :bkey

  def to_original
    original = ""
    @input.chars.each do |char|
      if ("a".."z").include?(char) then
        original << self.getOriginalChar(char)
      else
        original << char
      end
    end

    return original
  end

  def getOriginalChar(char)
    (0..25).each do |n|
      if (@akey * n + @bkey) % 26 == char.to_cipher_int then
        return n.to_cipher_char
      end
    end
  end

  def decideCipherKey(word)
    return false if word.size != 4

    a = nil
    b = nil

    (0..25).each do |n|
      if (26 * n + word[0].to_cipher_int - word[1].to_cipher_int) % 12 == 0 then
        a = (26 * n + word[0].to_cipher_int - word[1].to_cipher_int) / 12
        break
      end
    end

    return false if a.nil?

    (0..26).each do |n|
      if ("t".to_cipher_int * a + n) % 26 == word[0].to_cipher_int then
        b = n
        break
      end
    end

    return false if b.nil?

    return [a, b]
  end
end

file = File.readlines("./input.txt").map(&:chomp)
file.shift

file.each do |line|
  puts AffineCipher.new(line).to_original
end
