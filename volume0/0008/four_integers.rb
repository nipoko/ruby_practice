#!/usr/bin/ruby
=begin
AOJ問題 volume0-0008 4つの整数の和
50以下の正の整数nを入力し、0～9の範囲の整数a, b, c, dの組で
a + b + c + d = n
を満たすものの組み合わせ数を出力するプログラムを作成してください。
[input]
複数のデータセットが与えられます。各データセットにnが1行に与えられます。入力の最後まで処理してください。
[output]
各データセットごとに、a, b, c, dの組み合わせ個数を1行に出力してください。
[sample input]
35
1
[sample output]
4
4
=end

class Combi
  def initialize(sum)
    @sum = sum
  end
 
  attr_accessor :sum
 
  def calc(num)
    ret = 0
 
    (0..9).to_a.repeated_permutation(num).each do |ary|
      ret += 1 if ary.inject(:+) == @sum
    end
 
    return ret
  end
end
 
while line = gets
  puts Combi.new(line.to_i).calc(4)
end
