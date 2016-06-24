class CurrencyTrader
  def initialize(first_converter, second_converter, starting_currency = "USD")
    @first_converter = first_converter
    @second_converter = second_converter
    @starting_currency = starting_currency
  end

  def best_investment
    @first_converter.codes.fetch(:USD)
    # "you should invest in this:"
  end
end
