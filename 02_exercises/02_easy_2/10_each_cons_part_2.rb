# https://launchschool.com/exercises/711c6a89

require 'byebug'

def each_cons(arr, chunk_length, &block)
	if block.arity > 0
		arr.each_with_object(block.arity) do |n, size|
			yield(arr.slice(n,size)) unless chunk_length == arr[-1]
		end
	end
		nil
end

# hash = {}

each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = trues
end

# p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

# hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
# p hash == { 1 => 3, 3 => 6, 6 => 10 }

# hash = {}
# each_cons([1, 3, 6, 10], 3) do |value1, *values|
#   hash[value1] = values
# end
# p hash == { 1 => [3, 6], 3 => [6, 10] }

# hash = {}
# each_cons([1, 3, 6, 10], 4) do |value1, *values|
#   hash[value1] = values
# end
# p hash == { 1 => [3, 6, 10] }

# hash = {}
# each_cons([1, 3, 6, 10], 5) do |value1, *values|
#   hash[value1] = values
# end
# p hash == {}