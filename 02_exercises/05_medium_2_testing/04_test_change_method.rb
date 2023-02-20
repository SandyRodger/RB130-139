# https://launchschool.com/exercises/4c36c285

require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
	def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
		transaction.amount_paid += 30
		assert_equal(register.change(transaction), 10)
	end
end

# LS solution pretty much identical