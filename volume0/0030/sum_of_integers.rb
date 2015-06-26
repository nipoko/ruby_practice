#!/usr/bin/ruby
=begin
0 から 9 の数字から異なる n 個の数を取り出して合計が s となる組み合わせの数を出力するプログラムを作成してください。
n 個の数はおのおの 0 から 9 までとし、１つの組み合わせに同じ数字は使えません。
たとえば、n が 3 で s が6 のとき、3 個の数字の合計が 6 になる組み合わせは、
1 + 2 + 3 = 6
0 + 1 + 5 = 6
0 + 2 + 4 = 6
の 3 通りとなります。
[input]
複数のデータセットが与えられます。各データセットに
n (1 ≤ n ≤ 9) と s (0 ≤ s ≤ 100)が１つのスペースで区切られて１行に与えられます。
n と s が共に 0 のとき入力の最後とします（この場合は処理せずにプログラムを終了する）。
データセットの数は 50 を超えません。
[output]
各データセットに対して、n 個の整数の和が s になる組み合わせの数を１行に出力して下さい。
[sample input]
3 6
3 1
0 0
[sample output]
3
0
=end

def sum_integers(start, sum, num)
  count = 0

  (start..(10 - num)).each do |n|
    if num == 1 && sum == n then
      count += 1
    elsif sum - n < 0 then
      next
    else
      count += sum_integers(n + 1, sum - n, num - 1)
    end
  end

  return count
end

File.readlines("./input.txt").each do |line|
  data = line.split(" ").map(&:to_i)
  break if data[0] == 0 && data[1] == 0
  puts sum_integers(0, data[1], data[0])
end
