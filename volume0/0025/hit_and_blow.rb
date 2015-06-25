#!/usr/bin/ruby
=begin
AOJ問題 volume0-0025 ヒットアンドブロー
ヒットアンドブローというゲームがあります。Aさんが異なる４個の数字を思い浮かべ、Bさんがその数字を当てます。
Bさんが選んだ４個の数字に対し、Aさんは、
* 場所が一致している数字の個数（ヒット）
* 場所は違うが正解の中に含まれる数字の個数（ブロー）
を答えます。それを手がかりに、Bさんは再び４個の数字を選んでAさんに伝えます。例えば、Aさんが
9 1 8 2
という数字を思い浮かべたとします。このときBさんが
4 1 5 9
という数字を選んだら、Aさんは「１ヒット１ブロー」と答えます。

Aさんの思い浮かべた４個の数字と、Bさんが選んだ４個の数字を入力して
ヒットとブロー数の数を出力して終了するプログラムを作成して下さい。
ただし、４個の数字は０から９の範囲で、すべて異なります。
[input]
複数のデータセットが与えられます。各データセットは以下のような形式です。
a1 a2 a3 a4
b1 b2 b3 b4

ここで、
a1 (Aさん１個目の数：０から９の整数)
a2 (Aさん２個目の数：０から９の整数)
a3 (Aさん３個目の数：０から９の整数)
a4 (Aさん４個目の数：０から９の整数)
b1 (Bさん１個目の数：０から９の整数)
b2 (Bさん２個目の数：０から９の整数)
b3 (Bさん３個目の数：０から９の整数)
b4 (Bさん４個目の数：０から９の整数)
とします。入力の最後まで処理して下さい。
[output]
各データセットに対して、ヒット数とブロー数を１行に出力して下さい。
なお、ヒット数とブロー数は１つのスペースで区切って下さい。
[sample input]
9 1 8 2
4 1 5 9
4 6 8 2
4 6 3 2
[sample output]
1 1
3 0
=end

class Hash
  def hit
    hit_num = 0
    4.times do |n|
      hit_num += 1 if self[:input][n] == self[:output][n]
    end
    return hit_num
  end

  def blow
    blow_num = 0
    4.times do |n|
      blow_num += 1 if self[:input].include?(self[:output][n])
    end
    return blow_num - self.hit
  end

  def hit_and_blow
    self.hit.to_s + " " + self.blow.to_s
  end
end

datas = []
tmp = Hash.new()

File.readlines("./input.txt").each do |data|
  if tmp[:input] == nil then
    tmp[:input] = data.split(" ").map(&:to_i)
  else
    tmp[:output] = data.split(" ").map(&:to_i)
    datas << tmp
    tmp = Hash.new()
  end
end

datas.each do |hash|
  puts hash.hit_and_blow
end
