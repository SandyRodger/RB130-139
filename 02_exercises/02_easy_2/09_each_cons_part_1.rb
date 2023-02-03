# https://launchschool.com/exercises/7a2b407e

def each_cons(arr)
	arr.each_with_index.with_object(arr.size) do |(n, idx), size|
		yield(arr.slice(idx,size)) unless n == arr[-1]
	end
	nil
end

# LS solution:

def each_cons(array)
  array.each_with_index do |item, index|
    break if index + 1 >= array.size
    yield(item, array[index + 1])
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil