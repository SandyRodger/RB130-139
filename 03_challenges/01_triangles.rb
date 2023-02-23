# https://launchschool.com/exercises/4c45ef4c

# class Triangle
# 	attr_reader :s1, :s2, :s3
# 	def initialize(s1, s2, s3)
# 		raise ArgumentError if s1 >= 0 || s2 >= 0 || s3 >= 0
# 		raise ArgumentError if s1 < (s2 + s3) || s2 < (s1 + s3) || s3 < (s2 + s1)
# 		@s1 = s1
# 		@s2 = s2
# 		@s3 = s3
# 	end

# 	def kind
# 		return 'equilateral' if (s1 == s2) && (s2 == s3)
# 		return 'isosceles' if ((s1 != s2) && (s2 == s3)) || ((s1 == s2) && (s2 != s3)) || ((s1 == s3) && (s2 != s3)) 
# 		return 'scalene' if (s1 != s2) && (s2 != s3)
# 	end
# end

# LS solution:

class Triangle
  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError.new "Invalid triangle lengths" unless valid?
  end

  def kind
    if sides.uniq.size == 1
      'equilateral'
    elsif sides.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end

  private

  def valid?
    sides.min > 0 &&
    sides[0] + sides[1] > sides[2] &&
    sides[1] + sides[2] > sides[0] &&
    sides[0] + sides[2] > sides[1]
  end
end