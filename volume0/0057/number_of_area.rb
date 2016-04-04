#!/usr/bin/ruby
# AOJ問題 volume0-0057 最大の領域の数
# 無限に広い平面上に無限に長い直線を引いたとき、平面はいくつかの領域に分割される。
# n本の直線を引くことで得られる領域の最大数を求めるプログラムを作成せよ。

while num = gets
  num = num.to_i
  puts num * (num + 1) / 2 + 1
end
