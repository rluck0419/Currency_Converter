class Invalid_Type < StandardError
  def message
    "The different currencies cannot be added or subtracted until they are converted to the same currency."
  end
end

class Currency
  attr_reader :amount, :type

  def initialize(amount, type)
    @amount = amount
    @type = type
  end

  def ==(other)
    return false unless other.is_a?(Currency)
    @amount == other.amount && @type == other.type
  end

  def +(other)
    raise Invalid_Type.new unless other.is_a?(Currency) && @type == other.type#if you give me something that's not a meter, I'm going to throw you an error.
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
