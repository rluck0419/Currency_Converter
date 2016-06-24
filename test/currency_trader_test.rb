require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/currency.rb'
require_relative '../lib/currency_converter.rb'
require_relative '../lib/currency_trader.rb'

class CurrencyTraderTest < MiniTest::Test
  def currency_trader(codes_one, codes_two, starting_currency)
    ::CurrencyTrader.new(codes_one, codes_two, starting_currency)
  end

  def currency_converter(codes)
    ::CurrencyConverter.new(codes)
  end

  def currency(amount, type)
    ::Currency.new(amount, type)
  end
end
