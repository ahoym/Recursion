def range_it(start_num, end_num)
  result = []
  (start_num..end_num).each do |num|
    result << num
  end

  result
end


def range(num1, num2)
  return [num2] if num1 == num2

  [num1] + range(num1 + 1, num2)
end


def exponent1(base, number)
  return 1 if number == 0

  base * exponent1(base, number - 1)
end


def exponent2(base, number)
  return base if number == 1

  if number.even?
    exponent2(base, number / 2) ** 2
  elsif number.odd?
    base * (exponent2(base, (number - 1) / 2) ** 2)
  end
end


def deep_dup(arr)
  results = []

  arr.each do |elem|
    if elem.is_a?(Array)
      results << deep_dup(elem)
    else
      results << elem
    end
  end

  results
end


def fib(n)
  return [] if n <= 0
  return [0] if n == 1
  return [0, 1] if n == 2

  base = fib(n - 1)
  base << ( base[-1] + base[-2] )
end


def bsearch(array, target)
  return nil if array.empty?

  middle = array.length / 2
  if target == array[middle]
    middle
  elsif target < array[middle]
    index = bsearch(array[0...middle], target)
  else
    index = bsearch(array[middle + 1..-1], target)
    return nil if index.nil?
    middle + 1 + index
  end
end


def make_change(amt, coins = [25, 10, 5, 1])
  return [amt] if amt == coins.last
  return [] if amt == 0

  if amt < coins.first
    coins.shift
    make_change(amt, coins)
  else
    [coins.first] + make_change(amt - coins.first, coins)
  end
end


def merge_sort(array)
  return array if array.length == 1

  middle = (array.length / 2 == 1 ? 0 : array.length / 2)
  merge(merge_sort(array[0..middle]), merge_sort(array[middle + 1..-1]))
end

def merge(array1, array2)
  merged_array = []

  until array1.empty? || array2.empty?
    merged_array << (array1.first > array2.first ? array2.shift : array1.shift)
  end

  if array1.empty?
    merged_array << array2.shift until array2.empty?
  else
    merged_array << array1.shift until array1.empty?
  end

  merged_array
end


def subsets(arr)
  return [[]] if arr == []

  subs = subsets(arr[0..-2])
  last = arr[-1]
  result = []

  subs.each do |subset|
    result << subset + [last]
  end

  result + subs
end

