#!/usr/bin/ruby
=begin
AOJ問題 volume0-0032 プラスチック板
機械に辺・対角線の長さのデータを入力し、プラスティック板の型抜きをしている工場があります。
この工場では、サイズはいろいろですが、平行四辺形の型のみを切り出しています。
あなたは、切り出される平行四辺形のうち、長方形とひし形の製造個数を数えるように上司から命じられました。
「機械に入力するデータ」を読み込んで、長方形とひし形の製造個数を出力して終了するプログラムを作成してください。
[input]
「機械に入力するデータ」は、平行四辺形の隣り合う２辺の長さと対角線の長さが記録されています。おのおのの長さは全て整数で与えられます。入力例を参考にしてください。

辺1 の長さ, 辺2 の長さ, 対角線の長さ（1 件目のデータ：全て整数）
              ...            （2 件目のデータ：全て整数）
              ...            （3 件目のデータ：全て整数）
              ...
[output]
長方形の製造個数
ひし形の製造個数
[sample input]
3,4,5
5,5,8
4,4,4
5,4,3
[sample output]
1
2
=end

# 向かい合わない辺の長さをそれぞれm, n、対角線の長さをlとすると
# 長方形の条件：m ** 2 + n ** 2 == l ** 2
# ひし形の条件：m == n
# 両方の条件を満たす図形は「正方形」、これは「長方形でもひし形でもある」とする。

class Parallelogram
  def initialize(datas)
    @side_a = datas[0]
    @side_b = datas[1]
    @diagonal = datas[2]
  end

  attr_accessor :side_a, :side_b, :diagonal

  def rectangle?
    @side_a ** 2 + @side_b ** 2 == @diagonal ** 2
  end

  def diamond?
    @side_a == @side_b
  end
end

rectangle_num = 0
diamond_num = 0

File.readlines("./input.txt").each do |line|
  datas = line.split(",").map(&:to_i)
  parallelogram = Parallelogram.new(datas)
  rectangle_num += 1 if parallelogram.rectangle?
  diamond_num += 1 if parallelogram.diamond?
end

puts rectangle_num
puts diamond_num
