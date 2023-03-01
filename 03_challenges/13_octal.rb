# https://launchschool.com/exercises/fb0821cc

class Octal
	attr_accessor :base_8_number

	def initialize(base_8_number)
		@base_8_number = base_8_number
	end

	def to_decimal
		return 0 if invalid?
		base_8_number.chars.reverse.each_with_index.with_object([]) do |(n, idx), arr|
			arr << n.to_i * (8**idx)
		end.sum
	end

	def invalid?
		base_8_number.match?(/[^01234567]/)
	end
end

p Octal.new('6789').to_decimal

# LS solution:

# class Octal
#   attr_reader :number

#   def initialize(str)
#     @number = str
#   end

#   def to_decimal
#     return 0 unless valid_octal?(number)

#     arr_digits = number.to_i.digits

#     new_number = 0
#     arr_digits.each_with_index do |num, exponent|
#       new_number += (num * (8 ** exponent))
#     end

#     new_number
#   end

#   private

#   def valid_octal?(num)
#     num.chars.all? {|n| n =~ /[0-7]/}
#   end
# end