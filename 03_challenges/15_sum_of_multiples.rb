# https://launchschool.com/exercises/89734a2f

class SumOfMultiples
	attr_reader :arr

	def initialize(*arr)
		@arr = arr
	end

	def self.to(upper_limit)
		find_sum_of_multiples_up_to([3, 5], upper_limit)
	end

	def to(upper_limit)
		self.class.find_sum_of_multiples_up_to(arr, upper_limit)
	end

	def self.find_sum_of_multiples_up_to(multiples, upper_limit)
		multiples.each_with_object([]) do |num, obj|
			counter = 0
			loop do
				counter += 1
				break if(num * counter) >= upper_limit
				obj << (num * counter)
			end
		end.uniq.sum
	end

end

# LS solution

# class SumOfMultiples
#   attr_reader :multiples

#   def self.to(num)
#     SumOfMultiples.new().to(num)
#   end

#   def initialize(*multiples)
#     @multiples = (multiples.size > 0) ? multiples : [3, 5];
#   end

#   def to(num)
#     (1...num).select do |current_num|
#       any_multiple?(current_num)
#     end.sum
#   end

#   private

#   def any_multiple?(num)
#     multiples.any? do |multiple|
#       (num % multiple).zero?
#     end
#   end
# end

