#!/usr/bin/ruby
=begin
AOJ問題 volume0-0050 林檎と桃
福島県は果物の産地としても有名で、その中でも特に桃とりんごは全国でも指折りの生産量を誇っています。
ところで、ある販売用の英文パンフレットの印刷原稿を作ったところ、
手違いでりんごに関する記述と桃に関する記述を逆に書いてしまいました。
あなたは、apple と peach を修正する仕事を任されましたが、なにぶん面倒です。
１行の英文を入力して、そのなかの apple という文字列を全て peach に、
peach という文字列を全てapple に交換した英文を出力して終了するプログラムを作成してください。
入力される文字列の長さは 1000 以下です。
[input]
英文（半角英数字、空白、記号を含む）
[output]
apple とpeach という文字列を交換した英文
=end

while line = gets
  puts line.chomp.split(" ").each_with_index{ |word, idx|
    case true
    when word.include?("apple") then word.sub!(/apple/, "peach")
    when word.include?("peach") then word.sub!(/peach/, "apple")
    end
  }.join(" ")
end
