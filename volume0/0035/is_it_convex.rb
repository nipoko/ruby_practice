#!/usr/bin/ruby
=begin
AOJ問題 volume0-0035 凹みの検知
平面上の異なる4 点　A(xa, ya), B(xb, yb), C(xc, yc), D(xd, yd) の座標を読み込んで、
それぞれについて、それら4 点を頂点とした四角形 ABCD に凹みがなければ YES、
凹みがあればNO と半角大文字で出力して終了するプログラムを作成してください。
なお、xa, ya, xb, yb, xc, yc, xd, yd は、それぞれ-100 以上100 以下の実数とします。
なお、1 直線上に3 つ以上点が並ぶことはないものとします。
また、入力順に点を結んでいけば、四角形になる順番に点の座標が入力されるものとします。
[input]
xa,ya,xb,yb,xc,yc,xd,yd（1 件目のデータ:全て実数）
xa,ya,xb,yb,xc,yc,xd,yd（2 件目のデータ:全て実数）
xa,ya,xb,yb,xc,yc,xd,yd（3 件目のデータ:全て実数）
...
...
[output]
YES または NO (1 件目のデータに対する出力)
YES または NO (2 件目のデータに対する出力)
YES または NO (3 件目のデータに対する出力)
...
...
[sample input]
0.0,0.0,1.0,0.0,1.0,1.0,0.0,1.0
0.0,0.0,3.0,0.0,1.0,1.0,1.0,3.0
[sample output]
YES
NO
=end

# 四角形の内角の和は360度なので、凹四角形の凹角（180度より大きい角）はただ1つのみ。
#
# 2次元ベクトルの外積の応用
# ベクトルA,Bがあるとき、外積A×Bは以下の2通りで表せる
# A×B = |A| * |B| * sin(内角)
# A×B = ax * by - ay * bx
# ⇒ 外積は内角が180度を超えた場合にマイナスになる性質を利用して凹四角形の判定を行う
# ⇒ ベクトルがすべて逆向きの場合も踏まえ、4つの外積の積の正負で判定する

class Array
  def cross
    self[0] * self[3] - self[1] * self[2]
  end
end

File.readlines("./input.txt").each do |line|
  datas = line.split(",").map(&:to_f)
  a_cross = [datas[6] - datas[0], datas[7] - datas[1], datas[2] - datas[0], datas[3] - datas[1]].cross
  b_cross = [datas[0] - datas[2], datas[1] - datas[3], datas[4] - datas[2], datas[5] - datas[3]].cross
  c_cross = [datas[2] - datas[4], datas[3] - datas[5], datas[6] - datas[4], datas[7] - datas[5]].cross
  d_cross = [datas[4] - datas[6], datas[5] - datas[7], datas[0] - datas[6], datas[1] - datas[7]].cross

  if a_cross * b_cross * c_cross * d_cross > 0 then
    puts "YES"
  else
    puts "NO"
  end
end
