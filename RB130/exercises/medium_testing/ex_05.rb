require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(80)
  end

  def test_prompt_for_payment
  input = StringIO.new("80\n")
  @transaction.prompt_for_payment(input: input) 
  
  assert_equal(80, @transaction.amount_paid)
  end
end
