class Invalid_Type < StandardError
  def message
    "The different currencies cannot be added or subtracted until they are converted to the same currency."
  end
end

class Currency
  attr_reader :amount, :type

  def initialize(amount, type = "USD")
    if amount.is_a?(Fixnum) || amount.is_a?(Float)
      @amount = amount
    else
      @amount = amount[/\d+/].to_f
    end

    @type = type
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
