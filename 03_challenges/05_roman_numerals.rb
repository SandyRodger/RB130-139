# https://launchschool.com/exercises/117c3255
require 'byebug'
class RomanNumeral
	attr_reader :int
	attr_accessor :output

	ROM_NUMS = [[1000, "M", "MM", "MMM", "MMMM", "MMMMM", "MMMMMM", "MMMMMMM", "MMMMMMMM", "MMMMMMMMM"], [100, "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"], [10, "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"], [1, "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]]
							
	def initialize(int)
		@int = int
		@output = ""
	end

	def to_roman
		remainder = int
		ROM_NUMS.each do |nums_arr|
			add_letters(nums_arr, remainder) if divisible_by?(nums_arr.first)
			remainder = int % nums_arr.first
		end
		output
	end

	private

	def divisible_by?(divisor)
		int / divisor > 0
	end

	def add_letters(letters, remainder)
		target = letters[remainder/letters.first]
		output << target if target.is_a?(String)
	end

	def no_remainder_from?(divisor)
		int % divisor == 0
	end
end

# i = RomanNumeral.new(1)
# mmm = RomanNumeral.new(3000)
# dlxxv = RomanNumeral.new(575)
p RomanNumeral.new(402).to_roman

# LS SOLUTION:

# class RomanNumeral
#   attr_reader :number

#   ROMAN_NUMERALS = {
#     "M" => 1000,
#     "CM" => 900,
#     "D" => 500,
#     "CD" => 400,
#     "C" => 100,
#     "XC" => 90,
#     "L" => 50,
#     "XL" => 40,
#     "X" => 10,
#     "IX" => 9,
#     "V" => 5,
#     "IV" => 4,
#     "I" => 1
#   }

#   def initialize(number)
#     @number = number
#   end

#   def to_roman
#     roman_version = ''
#     to_convert = number

#     ROMAN_NUMERALS.each do |key, value|
#       multiplier, remainder = to_convert.divmod(value)
#       if multiplier > 0
#         roman_version += (key * multiplier)
#       end
#       to_convert = remainder
#     end
#     roman_version
#   end
# end