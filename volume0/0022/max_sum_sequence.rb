#!/usr/bin/ruby
=begin
AOJ問題 volume0-0022 最大連続部分和
与えられた整数の並びa1,a2,a3,...,anで、連続した項（1つ以上）の和の
最大値を出力して終了するプログラムを作成してください。
[input]
複数のデータセットが与えられます。各データセットは以下のような形式です。
n  （項数：  1 以上 5000 以下）
a1 （第1項： 整数 -100000 以上 100000 以下）
a2 （第2項： 整数 -100000 以上 100000 以下）
a3 （第3項： 整数 -100000 以上 100000 以下）
.
.
an （第n項： 整数 -100000 以上 100000 以下）
nが0のとき入力の最後とします（この場合は処理をしない）。
[output]
各データセットに対して、連続した項の和の最大値を出力してください。
[sample input]
7
-5
-1
6
4
9
-6
-7
13
1
2
3
2
-2
-1
1
2
3
2
1
-2
1
3
1000
-200
201
0
[sample output]
19
14
1001
=end

class Array
  def max_sum_sequence
    max = 0
    (1..self.size).each do |n|
      (self.size - n + 1).times do |m|
        tmp = self[m, n].inject(:+)
        max = tmp if max < tmp
      end
    end
    return max
  end
end

file = File.readlines("./input.txt").map(&:to_i)
datasets = []
tmp = []
data_num = -1

file.each do |data|
  case data_num
  when -1 then
    data_num = data
  when 0 then
    datasets << tmp
    tmp = []
    break if data == 0
    data_num = data
  else
    tmp << data
    data_num -= 1
  end
end

datasets.each do |data|
  puts data.max_sum_sequence
end
