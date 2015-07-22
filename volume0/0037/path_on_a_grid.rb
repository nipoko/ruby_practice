#!/usr/bin/ruby
=begin
AOJ問題 volume0-0037 格子状の経路
上から見ると図1のような形の格子状の広場があります。
この格子の各辺に「壁」があるかないかを 0 と 1 の並びで示しています。
点 A に立って壁に右手をつき、壁に右手をついたまま、矢印の方向に歩き続けて
再び点 A に戻ってくるまでの経路を出力して終了するプログラムを作成してください。
[input]
図2 に示すように壁がある場合を 1、ない場合を 0 として、 

1 行目は一番上の横線の壁の有無を左から 0 と 1 で表した文字列
2 行目はその下の縦線の壁の有無を左から0 と1 で表した文字列
3 行目は上から2 本目の横線の壁の有無を左から0 と1 で表した文字列
...
9 行目は一番下の横線の壁の有無を左から0 と1 で表した文字列

ただし、図１の太線に示すように、点 A から右に 1 区画分は必ず壁があるものとします。すなわち、1 行目の 1 文字目は常に 1 です。
[output]
「図の左方向に一区画分進む」を L で
「図の右方向に一区画分進む」を R で
「図の上方向に一区画分進む」を U で
「図の下方向に一区画分進む」を D で
表わし、進む順に L R U D を１行に並べて出力します。文字は全て半角大文字です。
[sample input]
1111
00001
0110
01011
0010
01111
0010
01001
0111
[sample output]
RRRRDDDDLLLUUURRDDLURULLDDDRRRUUUULLLL
=end

# 
# 座標と移動可否を定義するGridクラス
# 
class Grid
  # 
  # プロパティの初期化
  # @param array [Array] アプリの入力をそのまま配列にしたもの
  # 
  # @return [nil]
  def initialize(array)
    @input = array
  end

  attr_accessor :input

  # 
  # 座標を指定して上下左右にそれぞれ移動可能かを返す
  # @param x [Integer] 指定するx座標
  # @param y [Integer] 指定するy座標
  # 
  # @return [Hash]
  # @option [True/False] :up    指定座標から上方向に移動可能か
  # @option [True/False] :down  指定座標から下方向に移動可能か
  # @option [True/False] :left  指定座標から左方向に移動可能か
  # @option [True/False] :right 指定座標から右方向に移動可能か
  def conditions(x, y)
    return {
      up:    self.move?(x, y, :up),
      down:  self.move?(x, y, :down),
      left:  self.move?(x, y, :left),
      right: self.move?(x, y, :right)
    }
  end

  # 
  # 指定座標から指定方向に移動可能かを返す
  # @param x    [Integer] 指定するx座標
  # @param y    [Integer] 指定するy座標
  # @param axis [Symbol]  指定する移動方向
  # 
  # @return [True/false] 移動できるかどうか
  def move?(x, y, axis)
    return case axis
    when :up then
      if y == 0 then false
      else @input[2*y-1][x] == 1
      end
    when :down then
      if y == 4 then false
      else @input[2*y+1][x] == 1
      end
    when :left then
      if x == 0 then false
      else @input[2*y][x-1] == 1
      end
    when :right then
      if x == 4 then false
      else @input[2*y][x] == 1
      end
    end
  end
end

# 
# 座標上を移動するWalkerクラス
# 
class Walker
  # 
  # プロパティの初期化
  # 
  # @return [nil]
  def initialize
    @xposition = 0;
    @yposition = 0;
    @axis = :right;
  end

  attr_accessor :xposition, :yposition, :axis

  # 
  # Walkerの移動
  # 実際に自身の@xpositionと@ypositionを更新しながら動き、
  # 動いた方向を標準出力に返すのを初期位置に戻るまで繰り返す
  # @param grid [Grid] Walkerが移動する座標Gridのインスタンス
  # 
  # @return [nil]
  def move(grid)
    begin
      condition = grid.conditions(@xposition, @yposition)
      if condition[self.leftturn_axis] then
        @axis = self.leftturn_axis
        self.move_forward
      elsif condition[@axis] then
        self.move_forward
      elsif condition[self.rightturn_axis] then
        @axis = self.rightturn_axis
        self.move_forward
      else
        @axis = self.uturn_axis
        self.move_forward
      end
    end until @xposition == 0 && @yposition == 0

    puts
  end

  # 
  # Walkerが前進する
  # @axisの値に応じて、@xpositionと@ypositionの値を更新し、
  # 移動した方向を標準出力に返す
  # 
  # @return [nil]
  def move_forward
    case @axis
    when :up then
      @yposition = @yposition - 1
      print "U"
    when :down then
      @yposition = @yposition + 1
      print "D"
    when :left then
      @xposition = @xposition - 1
      print "L"
    when :right then
      @xposition = @xposition + 1
      print "R"
    end
  end

  # 
  # 左折する
  # @axisの値を元に方向を示すSymbolを返す
  # 
  # @return [Symbol]
  def leftturn_axis
    return case @axis
    when :right then :up
    when :up    then :left
    when :left  then :down
    when :down  then :right
    end
  end

  # 
  # 右折する
  # @axisの値を元に方向を示すSymbolを返す
  # 
  # @return [Symbol]
  def rightturn_axis
    return case @axis
    when :right then :down
    when :down  then :left
    when :left  then :up
    when :up    then :right
    end
  end

  # 
  # 後ろを向く
  # @axisの値を元に方向を示すSymbolを返す
  # 
  # @return [Symbol]
  def uturn_axis
    return case @axis
    when :right then :left
    when :left  then :right
    when :up    then :down
    when :down  then :up
    end
  end
end

file = []

File.readlines("./input.txt").each do |line|
  file << line.chomp.chars.map(&:to_i)
end

grid = Grid.new(file)
walker = Walker.new

walker.move(grid)
