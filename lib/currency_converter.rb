class CurrencyConverter
  attr_reader :codes

  def initialize(codes)
    @codes = codes
  end

  def convert(currency_obj, currency_code)
    rate = codes[currency_code.to_sym] / codes[currency_obj.type.to_sym]
    amount = currency_obj.amount * rate

    Currency.new(amount.round, currency_code)
  end
end
