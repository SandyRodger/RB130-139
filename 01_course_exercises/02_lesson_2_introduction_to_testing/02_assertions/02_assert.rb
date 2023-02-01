require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative '01_car'

class CarTest < MiniTest::Test
	def test_car_exists
		car = Car.new
		assert(car)
	end
end

