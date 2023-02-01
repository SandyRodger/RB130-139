array = [1, 2, 3, 4, 5]

def select(arr)
	arr.each_with_object([]) do |n, output| 
		output.push(n) if yield(n)
	end
end

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true