require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/currency_converter.rb'

class CurrencyConverterTest < MiniTest::Test
  def currency_converter
    ::CurrencyConverter.new
  end

  def test_currency_converter_exists
    assert currency_converter
  end

  def test_currency_converter_codes
    codes = {USD: 1.0, EUR: 0.87}
    assert_equal currency_converter.codes, codes
  end
end
