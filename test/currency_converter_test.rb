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
end
