require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative '01_car'

class CarTest < MiniTest::Test
	def test_includes_car
		car = Car.new
		arr = [1, 2, 3]
		arr << car
	
		assert_includes(arr, car)
	end
end

