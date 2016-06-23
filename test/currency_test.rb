require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/currency.rb'

class CurrencyTest < MiniTest::Test
  def currency(amount, type)
    ::Currency.new(amount, type)
  end

  def test_currency_exists
    assert currency(100, "USD")
  end

  def test_currency_equivalence
    assert_equal currency(100, "USD"), currency(100, "USD")
  end

  def test_currency_non_equivalence
    refute_equal currency(100, "USD"), currency(100, "EUR")
    refute_equal currency(50, "USD"), currency(100, "USD")
    refute_equal currency(40, "potatoes"), currency(5, "gameboys")
  end

  def test_currency_addition
    added_currency = currency(50, "USD") + currency(50, "USD")
    assert_equal added_currency, currency(100, "USD")
  end

  def test_currency_subtraction
    subtracted_currency = currency(100, "USD") - currency(50, "USD")
    assert_equal subtracted_currency, currency(50, "USD")
  end

  def test_for_wrong_type_error
    assert_raises(Invalid_Type) do currency(5, "doll hairs") + currency(5, "dollars") end
  end

  def test_currency_multiplication
    multiplied_currency = currency(100, "USD") * 2
    assert_equal multiplied_currency, currency(200, "USD")
    multiplied_currency = currency(100, "USD") * 0.5
    assert_equal multiplied_currency, currency(50, "USD")
  end
end
