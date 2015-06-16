#!/usr/bin/ruby
=begin
AOJ問題 volume0-0012 三角形の中の点
平面上に (x1, y1), (x2, y2), (x3, y3) を頂点とした三角形と点 P(xp, yp) があります。
点 P が三角形の内部(三角形の頂点や辺上は含まない)にあるなら YES、
三角形の外部にあるなら NO を出力して終了するプログラムを作成して下さい。
なお、与える点 P は三角形の頂点や辺の上にはないものとし、
x1, y1, x2, y2, x3, y3 xp, yp は、それぞれ -100 以上 100 以下とします。
[input]
複数のデータセットが与えられます。各データセットの形式は以下の通りです。
x1 y1 x2 y2 x3 y3 xp yp
与えられる入力は全て実数です。入力の最後まで処理してください。データセットの数は100を超えません。
入力は次の条件を満たします：
* 三角形の辺の長さは1.0以上である
* 三角形の辺と点Pの距離が0.001より小さくなることはない
[output]
各データセットに対して、YESまたはNOを1行に出力してください。
[sample input]
0.0 0.0 2.0 0.0 2.0 2.0 1.5 0.5
0.0 0.0 1.0 4.0 5.0 3.0 -1.0 3.0
[sample output]
YES
NO
=end

# 指針：「点が三角形の中にある」をプログラム的に表現する方法
# 三角形の一辺を基準とし、点と残り1つの頂点が同じ側にあるかどうかを判定
# 3つの辺で判定を行い、全て真であれば「点は三角形の中にある」と判定できる
# 「直線に対して2点が同じ側にある」とは：
# 点と直線との距離を算出して掛け合わせたときにプラスであれば同じ側、マイナスであれば反対側

class Array
  def distance
    return self[4] - self[0] if self[0] == self[2]
    a = self[3] - self[1]
    b = self[2] - self[0]
    c = a * self[0] - b * self[1]
    a * self[4] - b * self[5] + c / Math.sqrt(a ** 2 + b ** 2)
  end

  def same_side?
    if [self[0], self[1], self[2], self[3], self[4], self[5]].distance * [self[0], self[1], self[2], self[3], self[6], self[7]].distance > 0 then
      true
    else
      false
    end
  end

  def inside_triangle?
    point_a = [self[2], self[3], self[4], self[5], self[0], self[1], self[6], self[7]].same_side?
    point_b = [self[4], self[5], self[0], self[1], self[2], self[3], self[6], self[7]].same_side?
    point_c = self.same_side?

    if point_a && point_b && point_c then true
    else false
    end
  end
end

File.readlines("./input.txt").map(&:chomp).each do |data|
  if data.split(" ").map(&:to_f).inside_triangle? then
    puts "YES"
  else
    puts "NO"
  end
end
