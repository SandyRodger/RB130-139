# https://launchschool.com/exercises/48ffdb7b

class PerfectNumber

	def self.classify(int)
		raise StandardError if int <= 0
		return 'perfect' if aliquot_maker(int) == int
		return 'abundant' if aliquot_maker(int) > int
		return 'deficient' if aliquot_maker(int) < int
	end

	def self.aliquot_maker(int)
		(1...int).select{|n| int % n == 0}.sum
	end
end

# LS solution:

# class PerfectNumber
#   def self.classify(number)
#     raise StandardError.new if number < 1
#     sum = sum_of_factors(number)

#     if sum == number
#       'perfect'
#     elsif sum > number
#       'abundant'
#     else
#       'deficient'
#     end
#   end

#   class << self
#     private

#     def sum_of_factors(number)
#       (1...number).select do |possible_divisor|
#         number % possible_divisor == 0
#       end.sum
#     end
#   end
# end