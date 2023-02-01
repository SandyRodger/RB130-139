require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative '01_car'

class CarTest < MiniTest::Test
	def test_name_is_nil
		car = Car.new
		assert_nil(car.name)
	end
end

