class CurrencyTrader
  def initialize(first_converter, second_converter, starting_currency = "USD")
    @first_converter = first_converter
    @second_converter = second_converter
    @starting_currency = starting_currency
  end

  def best_investment(budget)
    investments = Hash.new

    @first_converter.codes.each_key do |code|
      investment = @first_converter.convert(Currency.new(budget, @starting_currency), code)
      investment = {investment.type => investment.amount}
      investments.merge!(investment)
    end

    greatest_profit = Currency.new(0, @starting_currency)
    type = @starting_currency

    investments.each do |code, amount|
      profit = @second_converter.convert(Currency.new(amount, code), @starting_currency)
      if profit.amount > greatest_profit.amount
        greatest_profit = profit
        type = code.to_s
      end
    end

    profit_amount = greatest_profit.amount - budget
    # Currency object:
    "By investing $#{budget} in #{type}, you'd expect to get back $#{greatest_profit.amount}, with a profit of $#{profit_amount}."
    # type
  end
end
