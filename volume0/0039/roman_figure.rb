#!/usr/bin/ruby
=begin
AOJ問題 volume0-0039 ローマ数字
古代ローマでは数を数えることは難しい仕事でした。アラビア数字の 0,1,2,3,…, 9 はまだ流布していませんでした。その代わり次のような記号が使われていました。
I は1, V は5, X は10, L は50, C は100, D は500, M は1000, 他の例は上の表を見てください。
小さい数が大きい数に続いている、つまり右側にあるときは足し算をします。
小さい数が大きい数の前に、つまり左にあるときは、大きい数から小さい数を引きます。
大きい数字の前にあって引き算を表す小さな数字は一回の引き算あたりひとつしかありません。
ローマ数字をアラビア数字（通常の数字）の表記（10 進表示）に変換して出力して終了するプログラムを作成してください。
ただし、与えられるローマ数字の文字列の長さはおのおの100 以下です。
また、与えられるローマ数字は上記のルールにのみ従っています(実際のローマ数字の表記にはもっと細かいルールがありますが、ここでは考慮する必要はありません。
たとえば、実際のローマ数字ではI はV かX から、X はL かC から、C はD かM からしか引き算しませんし、
同じローマ数字は４つ以上（または５つ以上）足し並べることはありません。)
[input]
複数のデータセットが与えられます。
それぞれのデータセットにローマ数字（半角大文字のI, V, X, L, C, D, M で表される連続した文字列）が１行に与えられます。
入力の最後まで処理して下さい。
[output]
各データセットに対し、アラビア数字（整数）を１行に出力して下さい。
[sample input]
IV
CCCCLXXXXVIIII
CDXCIX
[sample output]
4
499
499
=end

class Roman
  def initialize(figure)
    @figure = figure
  end

  attr_accessor :figure

  def to_i
    before_char_num = 0
    sum = 0
    tmp = 0

    @figure.chars.each_with_index do |char, idx|
      char_num = char.to_roman_num

      if before_char_num == char_num then
        tmp = tmp + char_num
        next
      elsif before_char_num == 0 then
        tmp = tmp + char_num
        before_char_num = char_num
        next
      end

      if before_char_num > char_num then
        sum = sum + tmp
      else
        sum = sum - tmp
      end

      tmp = char_num
      before_char_num = char_num
    end

    return sum + tmp
  end
end

class String
  def to_roman_num
    if self.size >= 2 then
      return Roman.new(self).to_i
    else
      return case self
      when "I" then 1
      when "V" then 5
      when "X" then 10
      when "L" then 50
      when "C" then 100
      when "D" then 500
      when "M" then 1000
      else 0
      end
    end
  end
end

File.readlines("./input.txt").each do |line|
  puts line.chomp.to_roman_num
end
