#!/usr/bin/ruby
=begin
AOJ問題 volume0-0047 カップゲーム
3 つのカップがふせて置かれています。
カップの置かれている場所を、順にA,B,C と呼ぶことにします。
最初はA に置かれているカップの中にボールが隠されているとします。
入れ替える２つのカップの位置を保存したデータがあります。
このデータを読み込んで、最終的にどの場所のカップにボールが隠されているかを出力して終了するプログラムを作成してください。
ただし、カップの位置を入れ替える際には、中に入っているボールも一緒に移動するものとします。
[input]
入れ替える２つのカップの位置（1 回目:文字列）
入れ替える２つのカップの位置（2 回目:文字列）
入れ替える２つのカップの位置（3 回目:文字列）
...
...
[output]
ボールが入っているカップの場所（文字列）
=end

class Game
  def initialize
    @cups = {A: true, B: false, C: false}
  end
 
  attr_accessor :cups
 
  def switch(one, another)
    tmp            = @cups[one]
    @cups[one]     = @cups[another]
    @cups[another] = tmp
  end
 
  def answer
    @cups.rassoc(true)[0]
  end
end
 
game = Game.new
 
while line = gets
  one, another = line.chomp.split(",").map(&:to_sym)
  game.switch(one, another)
end
 
puts game.answer
