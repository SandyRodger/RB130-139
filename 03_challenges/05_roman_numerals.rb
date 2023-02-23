# https://launchschool.com/exercises/117c3255

class RomanNumeral
	attr_reader :int

	def initialize(int)
		@int = int
	end

	def to_roman
		str_of_int = int.to_s
		length = str_of_int.length
		if length > 3
			
		end
	end

	def units

	end

	def tens

	end

	def hundreds

	end

	def thousands

	end
end

rnum_i = RomanNumeral.new(1)
rnum_mmm = RomanNumeral.new(3000)
p rnum_mmm.to_roman