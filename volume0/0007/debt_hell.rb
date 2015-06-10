#!/usr/bin/ruby
=begin
AOJ問題 volume0-0007 借金地獄
某国に住んでいる友達がお金に困って、あるヤミ金融業者から 10 万円の借金をしたまま、全く返済していないといいます。この業者は、一週間ごとに 5% の利子を借金に加え、さらに借金の 1,000 円未満を切り上げます。
n を入力したとき、n 週間後の借金の残高を出力し終了するプログラムを作成して下さい。n は 100 以下とします。
[input]
整数 n
[output]
n 週間後の返済額
[sample input]
5
[sample output]
130000
=end

class Numeric
  def calc_debt(week)
    return case week
    when 0 then self
    else self.calc_debt(week - 1)./(1000).*(1.05).ceil.*(1000)
    end
  end
end

week = File.read("./input.txt").to_i

puts 100_000.calc_debt(week)
