def each_cons(arr, chunk_length, &block)
	if block.arity > 0
		arr.each_with_object(block.arity) do |(chunk_length, idx), size|
			yield(arr.slice(idx,size)) unless n == arr[-1]
		end
		nil
end

each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end

each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end

each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end

each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end