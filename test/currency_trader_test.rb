require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/currency.rb'
require_relative '../lib/currency_converter.rb'
require_relative '../lib/currency_trader.rb'

class CurrencyTraderTest < MiniTest::Test
  # conversion rates at time 1
  CODES_ONE = {USD: 1.0, EUR: 0.88, GBP: 0.67, JPY: 102.20}
  # conversion rates at time 2
  CODES_TWO = {USD: 1.0, EUR: 0.91, GBP: 0.75, JPY: 101.91}
  INVESTMENT = "By investing $1000000 in JPY, you'd expect to get back $1002846, with a profit of $2846."

  def currency_trader(codes_one, codes_two, starting_currency)
    ::CurrencyTrader.new(codes_one, codes_two, starting_currency)
  end

  def currency_converter(codes)
    ::CurrencyConverter.new(codes)
  end

  def currency(amount, type)
    ::Currency.new(amount, type)
  end

  def test_currency_exists
    assert currency(100, "USD")
  end

  def test_currency_converter_exists
    assert currency_converter(CODES_ONE)
  end

  def test_currency_trader_exists
    one = currency_converter(CODES_ONE)
    two = currency_converter(CODES_TWO)
    assert currency_trader(one, two, "USD")
  end

  def test_best_investment
    one = currency_converter(CODES_ONE)
    two = currency_converter(CODES_TWO)
    assert_equal currency_trader(one, two, "USD").best_investment(1_000_000), INVESTMENT
  end
end
