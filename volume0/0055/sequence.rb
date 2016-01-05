#!/usr/bin/ruby
=begin
AOJ問題 volume0-0055 数列の和
次のように定義されている数列があります。
* すべての偶数番目の項は一つ前の項に 2 を掛けたものと等しい数である。
* すべての奇数番目の項は一つ前の項を 3 で割ったものと等しい数である。
この数列の初項 a を読み込み、それぞれについて、初項から第 10 項までの和 s(10) を出力して
終了するプログラムを作成してください。
ただし、a は1.0 以上10.0 以下とします。
[input]
定義された数列の初項 a（1 件目のデータ：実数）
定義された数列の初項 a（2 件目のデータ：実数）
定義された数列の初項 a（3 件目のデータ：実数）
...
...
[output]
s(10)（1 件目のデータに対する出力）
s(10)（2 件目のデータに対する出力）
s(10)（3 件目のデータに対する出力）
...
...
出力は0.000001以下の誤差を含んでもよい
=end

class Sequence
  def initialize(start_num)
    @start_num = start_num
  end
 
  attr_accessor :start_num
 
  def num(idx)
    even_num = idx / 2
    odd_num = (idx - 1) / 2
    return @start_num * 2 ** even_num / (3 ** odd_num)
  end
end
 
while start_num = gets
  sum = 0.0
  seq = Sequence.new(start_num.to_f)
  (1..10).each do |n|
    sum += seq.num(n)
  end
  puts sum.round(7)
end
