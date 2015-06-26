#!/usr/bin/ruby
=begin
マス目が描かれた「紙」があり、(1,2)のようにx,yの値の対でその上の位置を示すことにします。値は０から始まる整数とします。
この「紙」にインキを滴下します。インキ滴には「大」「中」「小」の３サイズがあり、インキ滴の落ちた地点を中心に周囲にも色がつきます。
「紙」は、最初は真っ白つまりどのマスも色の濃さを示す値が０とします。
インキ滴が落ちるごとに値が１ずつ増えていきます。インキの滲む範囲が紙の外にもなる場合は、紙の外部は無視します。
同じ場所に複数のインキ滴が落ちることもあり得ます。
「落とすインキ滴」のx,y,サイズ（小=1,中=2,大=3）を入力として読みこんで、
色のついていない部分（未だ滲んでこない部分）のマス目の個数と、
一番濃いマス目の濃さを出力するプログラムを作成してください。
なお、「紙」の大きさは10x10とし、滴下される点の位置を(x,y)とすると、(0<=x<10),(0<=y<10)です。
[input]
x1,y1,size
x2,y2,size
...
[output]
色のついていない部分のマス目の個数を第1行目に、一番濃いマス目の濃さを第2行目に出力してください。
[sample input]
2,5,3
3,6,1
3,4,2
4,5,2
3,6,3
2,4,1
[sample output]
77
5
=end

class Paper
  def initialize
    @face = Array.new
    10.times do |y|
      tmp = Array.new
      10.times do |x|
        tmp << 0
      end
      @face << tmp
    end
  end

  attr_accessor :face

  def drop_ink(array)
    x = array[0]
    y = array[1]
    size = array[2]
    @face[y][x] += 1
    @face[y - 1][x] += 1 if y - 1 >= 0
    @face[y][x - 1] += 1 if x - 1 >= 0
    @face[y + 1][x] += 1 if y + 1 < 10
    @face[y][x + 1] += 1 if x + 1 < 10
    return nil if size == 1
    @face[y - 1][x - 1] += 1 if y - 1 >= 0 && x - 1 >= 0
    @face[y + 1][x - 1] += 1 if y + 1 < 10 && x - 1 >= 0
    @face[y + 1][x + 1] += 1 if y + 1 < 10 && x + 1 < 10
    @face[y - 1][x + 1] += 1 if y - 1 >= 0 && x + 1 < 10
    return nil if size == 2
    @face[y - 2][x] += 1 if y - 2 >= 0
    @face[y][x - 2] += 1 if x - 2 >= 0
    @face[y + 2][x] += 1 if y + 2 < 10
    @face[y][x + 2] += 1 if x + 2 < 10
    return nil
  end

  def not_colored_mass
    count = 0
    10.times do |y|
      count += @face[y].count(0)
    end
    return count
  end

  def most_deep_color
    color = 0
    10.times do |y|
      10.times do |x|
        color = @face[y][x] if color < @face[y][x]
      end
    end
    return color
  end
end

paper = Paper.new

File.readlines("./input.txt").each do |line|
  paper.drop_ink(line.split(",").map(&:to_i))
end

puts paper.not_colored_mass
puts paper.most_deep_color
