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

  def test_currency_non_equivalence
    refute_equal currency(100, "$"), currency(100, "¢")
    refute_equal currency(50, "$"), currency(100, "$")
    refute_equal currency(40, "potatoes"), currency(5, "gameboys")
  end
end
