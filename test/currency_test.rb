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

  def test_currency_addition
    added_currency = currency(50, "$") + currency(50, "$")
    assert_equal added_currency, currency(100, "$")
  end

  def test_currency_subtraction
    subtracted_currency = currency(100, "$") - currency(50, "$")
    assert_equal subtracted_currency, currency(50, "$")
  end

  def test_for_wrong_type_error
    assert_raises(Invalid_Type) do currency(5, "doll hairs") + currency(5, "dollars") end
  end

  def test_currency_multiplication
    multiplied_currency = currency(100, "$") * 2
    assert_equal multiplied_currency, currency(200, "$")
    multiplied_currency = currency(100, "$") * 0.5
    assert_equal multiplied_currency, currency(50, "$")
  end
end
