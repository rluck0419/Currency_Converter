class CurrencyConverter
  attr_reader :codes

  def initialize(codes)
    @codes = codes
  end

  def convert(currency_obj, currency_code)
    currency_sym = currency_code.to_sym

# if USD: 1.0, EUR: 0.74, JPY: 120, 1 euro to yen ==> 120/0.74 ==> 162.2 yen
    if currency_obj.type == "USD"
      amount = currency_obj.amount * codes[currency_sym]
    else
      mul = 1 / codes[currency_obj.type.to_sym]
      amount = currency_obj.amount * mul
    end

    Currency.new(amount.round, currency_code)
  end
end
