#!/usr/bin/ruby
=begin
AOJ問題 volume0-0029 単語の出現頻度
英語の文章に出現する単語の中で、出現頻度が最も高い単語と、
文字数が最も多い単語を出力して終了するプログラムを作成してください。
入力データには英文字、スペースのみが含まれているものとします。
単語とは、スペースで区切られた連続する英文字の列です。文章の文字数は 1000 文字以下です。
一つの単語の文字数は 32文字以下です。
出現頻度が最も高い単語、最長の文字数を持つ単語はそれぞれ文中にただ一つだけ存在するものとします。
[input]
英語の文章を表現する文字列（半角の英文字、スペース）
[output]
最も出現頻度が高い単語と、最も文字数が多い単語を1つのスペースで区切って1行に出力してください。
[sample input]
Thank you for your mail and your lectures.
[sample output]
your lectures
=end

count = Hash.new(0)

File.read("./input.txt").gsub(/\./, "").downcase.split(" ").each do |word|
  count[word] += 1
end

puts count.sort{|a, b| b[1] <=> a[1]}.shift[0] + " " + count.sort{|a, b| b[0].size <=> a[0].size}.shift[0]
