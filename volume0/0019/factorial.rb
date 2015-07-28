#!/usr/bin/ruby
=begin
AOJ問題 volume0-0019 階乗
整数nを入力し、nの階乗を出力して終了するプログラムを作成してください。
ただし、nは1以上20以下とします。
[input]
n（整数）
[output]
nの階乗
[sample input]
5
[sample output]
120
=end

class Fixnum
  def factorial
    case self
    when 1 then 1
    else self * (self - 1).factorial
    end
  end
end
 
puts gets.to_i.factorial
