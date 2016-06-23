class CurrencyConverter
  attr_reader :codes

  def initialize
    @codes = {USD: 1.0, EUR: 0.87}
  end
end
