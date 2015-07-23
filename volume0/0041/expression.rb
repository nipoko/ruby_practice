#!/usr/bin/ruby
=begin
AOJ問題 volume0-0041 数式
与えられた 4 つの 1 から 9 の整数を使って、答えが 10 になる式をつくります。
4 つの整数 a, b, c, d を入力したとき、下記の条件に従い、答えが 10 になる式を出力して終了するプログラムを作成してください。
また、答えが複数ある時は、最初に見つかった答えだけを出力するものとします。答えがない時は、0 と出力してください。
* 演算子として、加算 (+)、減算 (-)、乗算 (*) だけを使います。除算 (/) は使いません。使用できる演算子は３個です。
* 数を4つとも使わなければいけません。
* 4つの数の順番は自由に入れ換えてかまいません。
* カッコを使ってもかまいません。使用できるカッコは３組（６個）以下です。
[input]
複数のデータセットが与えられます。各データセットの形式は以下のとおり：
a b c d
入力は４つの0で終了します。データセットの数は 40 を超えません。
[output]
各データセットについて、与えられた 4 つの整数と上記の演算記号および
カッコを組み合わせて値が 10 となる式または 0　を１行に出力してください。
式の文字列が1024文字を超えてはいけません。
[sample input]
8 7 9 9
4 4 4 4
5 5 7 5
0 0 0 0
[sample output]
((9 * (9 - 7)) - 8)
0
((7 * 5) - (5 * 5))
=end

# 4つの数字に四則演算を適用して1つの数字にするための2つの方法
# 1. 前から順に処理する
#   a   b   c   d
#  (a ? b)  c   d  まずaとbを計算
# ((a ? b)? c)  d  その計算結果とcを計算
#(((a ? b)? c)? d) その計算結果とdを計算
# 2. 前後の2個ずつ分けて計算し、最後にあわせる
#   a   b   c   d
#  (a ? b) (c ? d) aとb、cとdをそれぞれ計算
# ((a ? b)?(c ? d))それぞれの計算結果をあわせる

def searchCalc(nums)
  nums.permutation(nums.size){ |arr|
    tmp = arr.clone
    ret = searchCalc1(arr)
    return ret unless ret == 0
    ret = searchCalc2(tmp)
    return ret unless ret == 0
  }
  return 0
end

def searchCalc1(nums)
  num1 = nums.shift
  num2 = nums.shift
  operators = searchOperator(num1, num2, nums)

  if operators == false then
    return 0
  end

  return "(((#{num1} #{operators[0]} #{num2}) #{operators[1]} #{nums[0]}) #{operators[2]} #{nums[1]})"
end

def searchCalc2(nums)
  operator = [:+, :-, :*]

  operator.each do |op1|
    tmp1 = [nums[0], nums[1]].inject(op1)
    operator.each do |op2|
      tmp2 = [nums[2], nums[3]].inject(op2)
      ret = searchOperator(tmp1, tmp2, [])

      unless ret == false then
        return "((#{nums[0]} #{op1} #{nums[1]}) #{ret[0]} (#{nums[2]} #{op2} #{nums[3]}))"
      end
    end
  end

  return 0
end

def searchOperator(num1, num2, nums)
  operator = [:+, :-, :*]
  remains = nums.clone

  if remains.empty? then
    loop_flag = false
  else
    num3 = remains.shift
    loop_flag = true
  end

  operator.each do |op|
    tmp = [num1, num2].inject(op)
    if loop_flag then
      ret = searchOperator(tmp, num3, remains)
      return ret.unshift(op) unless ret == false
    elsif tmp == 10 then
      return [op]
    end
  end

  return false
end

File.readlines("./input.txt").each do |line|
  break if line == "0 0 0 0\n"
  puts searchCalc(line.split(" ").map(&:to_i))
end
