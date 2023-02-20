# https://launchschool.com/exercises/64799839

# require 'minitest/autorun'
# require_relative 'cash_register'
# require_relative '2_transaction'

# class CashRegisterTest < Minitest::Test
# 	def test_prompt_for_payment
# 		register = CashRegister.new(1000)
#     transaction = Transaction.new(20)
# 		input = StringIO.new("20\n")
# 		assert_nil(transaction.prompt_for_payment(input: input))
# 	end
# end

# LS solution:

require 'minitest/autorun'
require_relative '2_transaction'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30\n')
    transaction.prompt_for_payment(input: input)
    assert_equal 30, transaction.amount_paid
  end
end
