require 'minitest/autorun'
require_relative 'monster'
require "minitest/reporters"
Minitest::Reporters.use!

class MonsterTest < Minitest::Test   # The test class must subclass Minitest::Test, to inherit the methods needed.
	def test_teeth                     # The tests are written as methods beginnning with 'test_' (by convention)
		monster = Monster.new(200)       # We set up the objects to assert against.
		assert_equal(200, monster.teeth) # Within each test we must include at least one assertion.
	end
  
   def test_bad_teeth
    skip                             # This is how you skip a test.
    monster = Monster.new(100)       
		assert_equal(200, monster.teeth)
  end
  
end