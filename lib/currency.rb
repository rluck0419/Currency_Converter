class Invalid_Type < StandardError
  def message
    "The different currencies cannot be added or subtracted until they are converted to the same currency."
  end
end

class Currency
  attr_reader :amount, :type
  CODES = {"$" => "USD", "¥" => "JPY"}

  def initialize(amount, type = nil)
    if amount.is_a?(Fixnum) || amount.is_a?(Float)
      @amount = amount
      @type = type
    else
      @amount = amount[/\d+/].to_f
      @type = type
      if CODES.key?(amount[/\D/])
        @type = CODES.fetch(amount[/\D/])
      end
    end
  end

  def ==(other)
    return false unless other.is_a?(Currency)
    @amount == other.amount && @type == other.type
  end

  def +(other)
    raise Invalid_Type.new unless other.is_a?(Currency) && @type == other.type
    Currency.new(@amount + other.amount, @type)
  end

  def -(other)
    raise Invalid_Type.new unless other.is_a?(Currency) && @type == other.type
    Currency.new(@amount - other.amount, @type)
  end

  def *(other)
    raise Invalid_Type.new unless other.is_a?(Fixnum) || other.is_a?(Float)
    Currency.new(@amount * other, @type)
  end
end
