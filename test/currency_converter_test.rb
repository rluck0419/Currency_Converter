require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/currency_converter.rb'
require_relative '../lib/currency.rb'

class CurrencyConverterTest < MiniTest::Test
  def currency_converter(codes)
    ::CurrencyConverter.new(codes)
  end

  def currency(amount, type)
    ::Currency.new(amount, type)
  end

  def test_currency_converter_exists
    codes = {USD: 1.0, EUR: 0.88}
    assert currency_converter(codes)
  end

  def test_currency_converter_codes
    codes = {USD: 1.0, EUR: 0.88}
    assert_equal currency_converter(codes).codes, codes
  end

  def test_currency_convert_two
    codes = {USD: 1.0, EUR: 0.88}
    assert_equal currency_converter(codes).convert(currency(100, "USD"), "USD"), currency(100, "USD")
    assert_equal currency_converter(codes).convert(currency(100, "USD"), "EUR"), currency(88, "EUR")
    assert_equal currency_converter(codes).convert(currency(88, "EUR"), "USD"), currency(100,"USD")
  end

  def test_currency_convert_three
    codes = {USD: 1.0, EUR: 0.88, GBP: 0.67}
    assert_equal currency_converter(codes).convert(currency(100, "USD"), "EUR"), currency(88, "EUR")
    assert_equal currency_converter(codes).convert(currency(88, "EUR"), "USD"), currency(100, "USD")
    assert_equal currency_converter(codes).convert(currency(100, "USD"), "GBP"), currency(67, "GBP")
    assert_equal currency_converter(codes).convert(currency(88, "EUR"), "GBP"), currency(67, "GBP")
  end

  def test_unknown_currency_code
    codes = {USD: 1.0, EUR: 0.88, GBP: 0.67}
    assert_raises(Unknown_Currency_Code) do currency_converter(codes).convert(currency(100,"USD"),"JPY") end
  end
end
