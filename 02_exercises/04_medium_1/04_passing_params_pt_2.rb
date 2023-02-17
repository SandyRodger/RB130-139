# https://launchschool.com/exercises/8621919c

# Based on the examples shown above, write a method that takes an array as an argument. The method should yield the contents of the array to a block, which should assign your block variables in such a way that it ignores the first two elements, and groups all remaining elements as a raptors array.

arr = %w(raven finch hawk eagle) # => ['raven','finch','hawk','eagle']

def birds(arr)
	yield(arr)
end


birds(arr){|_, _, *raptors| p raptors}

# LS solution:

birds = ['crow', 'finch', 'hawk', 'eagle']

def types(birds)
  yield birds
end

types(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}."
end