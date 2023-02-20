# https://launchschool.com/exercises/82de3f03

require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
	def test_accept_money
		cash_register = CashRegister.new(300)
		transaction = Transaction.new(100)
		assert_equal(accept_money(transaction), 400)
	end
end

# LS solution:

# require 'minitest/autorun'
# require_relative 'cash_register'
# require_relative 'transaction'

# class CashRegisterTest < Minitest::Test
#   def test_accept_money
#     register = CashRegister.new(1000)
#     transaction = Transaction.new(20)
#     transaction.amount_paid = 20

#     previous_amount = register.total_money
#     register.accept_money(transaction)
#     current_amount = register.total_money

#     assert_equal previous_amount + 20, current_amount
#   end
# end