class CurrencyTrader
  # conversion rates at time 1
  CODES_ONE = {USD: 1.0, EUR: 0.88, GBP: 0.67, JPY: 102.20}
  # conversion rates at time 2
  CODES_TWO = {USD: 1.0, EUR: 0.89, GBP: 0.72, JPY: 102.20}
  def initialize(first_converter, second_converter, starting_currency = "USD")
    @first_converter = CODES_ONE
    @second_converter = CODES_TWO
    @starting_currency = starting_currency
  end

  
end
