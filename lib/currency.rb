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
end
