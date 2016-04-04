#!/usr/bin/ruby
# AOJ問題 volume0-0058 直交
# 平面上の異なる4点、A(xA, yA), B(xB, yB), C(xC, yC), D(xD, yD) の座標を読み込んで、
# それぞれについて、直線ABとCDが直交する場合にはYES、直交しない場合にはNOと
# 半角大文字で出力して終了するプログラムを作成してください。
# ただし、xA, yA, xB, yB, xC, yC, xD, yD は、
# それぞれ -100 以上 100 以下の実数とします。ここで、「直線」とは線分のことではありません。

while line = gets
  ary = line.split(" ").map(&:to_f)
  ab = [ary[2] - ary[0], ary[3] - ary[1]]
  cd = [ary[6] - ary[4], ary[7] - ary[5]]
  puts (ab[0] * cd[0] + ab[1] * cd[1] == 0) ? "YES" : "NO"
end
