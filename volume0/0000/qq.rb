#!/usr/bin/ruby
=begin
AOJ問題 volume0-0000 [九九の出力]
実行すると以下の出力が得られるプログラムを作成せよ。
[sample output]
1x1=1
1x2=2
1x3=3
...
9x7=63
9x8=72
9x9=81
=end

(1..9).each do |a|
  (1..9).each do |b|
    puts "#{a}x#{b}=#{a * b}"
  end
end
