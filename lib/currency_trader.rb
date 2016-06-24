class CurrencyTrader
  def initialize(first_converter, second_converter, starting_currency = "USD")
    @first_converter = first_converter
    @second_converter = second_converter
    @starting_currency = starting_currency
  end
end
