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

  def test_accept_money
    @transaction.amount_paid = 80
    previous_amount = @register.total_money
    current_amount = @register.accept_money(@transaction)

    assert_equal previous_amount + 80, current_amount
  end

  def test_change
    @transaction.amount_paid = 100
    
    assert_equal 20, @register.change(@transaction)
  end

  def test_give_receipt
    assert_output("You've paid $80.\n") { @register.give_receipt(@transaction) }
  end
end
