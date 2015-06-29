#!/usr/bin/ruby
=begin
AOJ問題 volume0-0033 玉
二股に分かれている容器があります。
1 から10 までの番号が付けられた10 個の玉を容器の開口部 A から落とし、左の筒 B か右の筒 C に玉を入れます。
板 D は支点 E を中心に左右に回転できるので、板 D を動かすことで
筒 B と筒 C のどちらに入れるか決めることができます。
開口部 A から落とす玉の並びを与えます。それらを順番に筒 B 又は筒 Cに入れていきます。
このとき、筒 B と筒 C のおのおのが両方とも番号の小さい玉の上に大きい玉を並べられる場合は YES、
並べられない場合は NO と半角大文字で出力して終了するプログラムを作成してください。
ただし、容器の中で玉の順序を入れ替えることはできないものとします。
また、続けて同じ筒に入れることができるものとし、筒 B, C ともに10 個の玉がすべて入るだけの余裕があるとします。
[input]
複数のデータセットが与えられます。
１行目にデータセット数 N が与えられます。つづいて、N 行のデータセットが与えられます。
各データセットに 10 個の番号が与えられます。左から１番目の玉の番号、２番目の玉の番号、、、といった順番です。
[output]
各データセットに対して、YES または NO を出力して下さい。
[sample input]
2
3 1 4 2 5 6 7 8 9 10
10 9 8 7 6 5 4 3 2 1
[sample output]
YES
NO
=end

tube_b = []
tube_c = []

file = File.readlines("./input.txt")
file.shift

file.each do |line|
  print_str = "YES"

  line.split(" ").map(&:to_i).each do |ball|
    case
    when tube_b.empty? then tube_b << ball
    when tube_c.empty? then tube_c << ball
    when tube_b[0] < ball && tube_c[0] > ball then tube_b.unshift(ball)
    when tube_b[0] > ball && tube_c[0] < ball then tube_c.unshift(ball)
    when tube_b[0] < ball && tube_c[0] < ball then
      if tube_b[0] > tube_c[0] then tube_b.unshift(ball)
      else                          tube_c.unshift(ball)
      end
    else
      print_str = "NO"
      next
    end
  end

  puts print_str
end
