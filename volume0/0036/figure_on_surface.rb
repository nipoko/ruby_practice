#!/usr/bin/ruby
=begin
AOJ問題 volume0-0036 平面の中の図形
縦8、横8のマスからなる平面があります。
その平面上に、AからGの図形のどれかが1つだけ置かれています。
（問題文参照 http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0036）
平面の中で図形が占めているマスを1、占めていないマスを0 で表現した数字の列を読み込んで、
置かれている図形の種類（A～G）を出力して終了するプログラムを作成してください。
ただし、ひとつの平面に置かれている図形は必ず１つで、複数の図形が置かれていることはありません。
また、A～G で表される図形以外のものが置かれていることはありません。
[input]
平面の中で図形が占めているマスを1、占めていないマスを0で表現した8文字からなる文字列が8行でひとつの平面となります。
平面と平面の区切りを空行で表します。
[output]
各平面に与えられた図形の種類（A～G のいずれか）を半角大文字で１行にひとつずつ出力してください。
[sample input]
00000000
00000000
01100000
00110000
00000000
00000000
00000000
00000000

00011110
00000000
00000000
00000000
00000000
00000000
00000000
00000000

00000000
00000000
00110000
00110000
00000000
00000000
00000000
00000000
[sample output]
E
C
A
=end

class Surface
  def initialize(array)
    @coordinates = array
    @reference = self.first_point
  end

  attr_accessor :coordinates
  attr_reader :reference

  def decide_figure
    if self.point_right? then
      if self.point_bottom? then
        if self.point_right_below? then
          return "A"
        else
          return "G"
        end
      else
        if self.point_right_below? then
          return "E"
        else
          return "C"
        end
      end
    else
      if self.point_deep_bottom? then
        return "B"
      else
        if self.point_right_below? then
          return "F"
        else
          return "D"
        end
      end
    end
  end

  def point_right?
    @coordinates[@reference[0]][@reference[1] + 1] == 1
  end

  def point_bottom?
    @coordinates[@reference[0] + 1][@reference[1]] == 1
  end

  def point_right_below?
    @coordinates[@reference[0] + 1][@reference[1] + 1] == 1
  end

  def point_deep_bottom?
    @coordinates[@reference[0] + 2][@reference[1]] == 1
  end

  def first_point
    @coordinates.each_with_index do |line, x|
      line.each_with_index do |mass, y|
        if mass == 1 then
          return [x, y]
        end
      end
    end
  end
end

line_num = 0
tmp_array = []
surfaces = []

File.readlines("./input.txt").each do |line|
  next if line.chomp == ""

  tmp_array << line.chomp.split("").map(&:to_i)
  line_num += 1

  if line_num == 8 then
    surfaces << Surface.new(tmp_array)
    line_num = 0
    tmp_array = []
  end
end

surfaces.each do |surface|
  puts surface.decide_figure
end
