require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/currency.rb'

class CurrencyTest < MiniTest::Test
  def currency(amount, type)
    ::Currency.new(amount, type)
  end

  def test_currency_exists
    assert currency(100, "$")
  end

  def test_currency_equivalence
    assert_equal currency(100, "$"), currency(100, "$")
  end
end
