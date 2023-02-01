require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative '01_car'

class CarTest < MiniTest::Test
	def test_raise_initialize_with_arg
		assert_raises(ArgumentError) do
			car = Car.new(name: "Joey")         # this code raises ArgumentError, so this assertion passes
		end
	end
end

