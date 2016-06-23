class Unknown_Currency_Code < StandardError
  def message
    "Unkown currency code. Make sure the hash isn't missing any currency codes!"
  end
end

class CurrencyConverter
  attr_reader :codes

  def initialize(codes)
    @codes = codes
  end

  def convert(currency_obj, currency_code)
    raise Unknown_Currency_Code.new unless codes.key?(currency_code.to_sym)
    rate = codes[currency_code.to_sym] / codes[currency_obj.type.to_sym]
    amount = currency_obj.amount * rate

    Currency.new(amount.round, currency_code)
  end
end
