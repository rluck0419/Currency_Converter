require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/currency_converter.rb'
require_relative '../lib/currency.rb'

class CurrencyConverterTest < MiniTest::Test
  def currency_converter
    ::CurrencyConverter.new
  end

  def currency(amount, type)
    ::Currency.new(amount, type)
  end

  def test_currency_converter_exists
    assert currency_converter
  end

  def test_currency_converter_codes
    codes = {USD: 1.0, EUR: 0.87}
    assert_equal currency_converter.codes, codes
  end

  def test_currency_convert
    assert_equal currency_converter.convert(currency(100,"USD"), "EUR"), currency(87,"EUR")
    assert_equal currency_converter.convert(currency(87,"EUR"), "USD"), currency(100,"USD")
  end
end
