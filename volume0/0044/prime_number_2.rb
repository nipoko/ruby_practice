#!/usr/bin/ruby
=begin
AOJ問題 volume0-0044 最小の素数と最大の素数
素数というのは、１よりも大きくそれ自身か 1 でしか割りきれない整数をいいます。
例えば、2 は、2 と 1でしか割り切れないので素数ですが、
12 は、12 と 1 のほかに、2, 3, 4, 6 で割りきれる数なので素数ではありません。
整数 n を入力したとき、n より小さい素数のうち最も大きいものと、
n より大きい素数のうち最も小さいものを出力して終了するプログラムを作成してください。
ただし、n は 3 以上 50000 以下とします。
[input]
複数のデータセットが与えられます。各データセットに n が１行に与えられます。入力の最後まで処理して下さい。
[output]
各データセットに対して、n より小さい素数のうち最大のものと、
n より大きい素数のうち最小のものを１つのスペースで区切って１行に出力して下さい。
=end
require("prime")
 
while num = gets
  num = num.to_i
  top = 0
  bottom = 0
  Prime.each do |prime|
    if prime > num then
      top = prime
      break
    end
    bottom = prime if num != prime
  end
 
  puts "#{bottom} #{top}"
end
