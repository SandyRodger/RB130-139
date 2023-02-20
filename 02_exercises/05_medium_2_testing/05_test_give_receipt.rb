# https://launchschool.com/exercises/4c36c285

require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
	def test_give_receipt
		register = CashRegister.new(1000)
    transaction = Transaction.new(20)
		assert_equal(give_receipt(transaction), "You've paid $20.")
	end
end

# LS solution (very similar):

# require 'minitest/autorun'
# require_relative 'cash_register'
# require_relative 'transaction'

# class CashRegisterTest < Minitest::Test

#   # Other tests omitted for brevity

#   def test_give_receipt
#     item_cost = 35
#     register = CashRegister.new(1000)
#     transaction = Transaction.new(item_cost)
#     assert_output("You've paid $#{item_cost}.\n") do
#       register.give_receipt(transaction)
#     end
#   end
# end