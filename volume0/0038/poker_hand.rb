#!/usr/bin/ruby
=begin
AOJ問題 volume0-0038 ポーカーの役
ポーカーの手札データを読み込んで、それぞれについてその役を出力して終了するプログラムを作成してください。
ただし、この問題では、以下のルールに従います。
* ポーカーはトランプ 5 枚で行う競技です。
* 同じ数字のカードは 5 枚以上ありません。
* ジョーカーは無いものとします。
* 以下のポーカーの役だけを考えるものとします。(下にいくにつれて役が高くなります。)
  1. 役なし(以下に挙げるどれにも当てはまらない)
  2. ワンペア（2 枚の同じ数字のカードが1 組ある）
  3. ツーペア（2 枚の同じ数字のカードが2 組ある）
  4. スリーカード（3 枚の同じ数字のカードが1 組ある）
  5. ストレート（5 枚のカードの数字が連続している）
     A を含むストレートの場合、A で終わる並びもストレートとします。
     つまり、A を含むストレート は、A 2 3 4 5 　と　10 J Q K A 　の２種類です。
     J Q K A 2 などのように、A をまたぐ並び はストレートではありません。（この場合、役なし　になります）。
  6. フルハウス（3 枚の同じ数字のカードが1 組と、残りの2 枚が同じ数字のカード）
  7. フォーカード（4 枚の同じ数字のカードが1 組ある）
[input]
トランプのJ(ジャック) を11、Q(クイーン) を12、K(キング) を13、A（エース）を 1 のそれぞれの数字で表すこととします。

手札1, 手札2, 手札3, 手札4, 手札5（1 件目のデータ：正の整数）
手札1, 手札2, 手札3, 手札4, 手札5（2 件目のデータ：正の整数）
手札1, 手札2, 手札3, 手札4, 手札5（3 件目のデータ：正の整数）
手札1, 手札2, 手札3, 手札4, 手札5（4 件目のデータ：正の整数）
... 　　　　　　　　　　　　　　
... 　　　　　　　　　　
[output]
手札によってできるもっとも高い役をひとつ出力するようにしてください。
たとえば、3 3 2 3 3 という手札であったときは、two pair ではなく four card です。
[sample input]
1,2,3,4,1
2,3,2,3,12
12,13,11,12,12
7,6,7,6,7
3,3,2,3,3
6,7,8,9,10
11,12,10,1,13
11,12,13,1,2
[sample output]
one pair
two pair
three card
full house
four card
straight
straight
null
=end

class Poker
  def initialize(hand)
    @hand = hand
  end

  attr_accessor :hand

  # 1. 手札の数字が2種類である
  # 1-1. いずれかの数字のカードが4枚である => four card
  # 1-2. 1-1以外（3枚・2枚の組み合わせ） => full house
  # 2. 手札の数字が全て異なる
  # 2-1. ソートしたときに数字が1つずつ大きい状態 => straight
  # 2-2. 2-1以外 => bust
  # 3. 手札の数字が3種類である
  # 3-1. いずれかの数字のカードが3枚である => three card
  # 3-2. 3-1以外（2枚、2枚、1枚の組み合わせ） => two pair
  # 4. 1～3以外（数字が4種類=>必ずペアがひとつ） => one pair
  def yaku
    case @hand.uniq.size
    when 2 then
      if self.numerous_card_num == 4 then puts "four card"
      else puts "full house"
      end
    when 5 then
      if self.straight? then puts "straight"
      else puts "null"
      end
    when 3 then
      if self.numerous_card_num == 3 then puts "three card"
      else puts "two pair"
      end
    else
      puts "one pair"
    end
  end

  def numerous_card_num
    card_num = Hash.new

    @hand.each do |card|
      if card_num[card] == nil then 
        card_num[card] = 1
      else
        card_num[card] = card_num[card] + 1
      end
    end

    return card_num.sort{|a, b|
      b[1] <=> a[1]
    }.first[1]
  end

  def straight?
    before_num = 0;
    @hand.map(&:to_i).sort.each do |num|
      if before_num != 0 && num - before_num != 1 && !(num == 10 && before_num == 1) then
        return false
      end

        before_num = num
    end

    return true
  end
end

File.readlines("./input.txt").each do |line|
  Poker.new(line.chomp.split(",")).yaku
end
