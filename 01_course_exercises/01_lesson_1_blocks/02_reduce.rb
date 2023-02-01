 # https://launchschool.com/lessons/c0400a9c/assignments/c1edc867
 
array = [1, 2, 3, 4, 5]

def reduce(arr, a=0)
	output = a
	arr.each do |n|
		output = yield(output, n)
	end
	output
end

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass