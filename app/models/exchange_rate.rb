class ExchangeRate
  attr_reader :original, :converted

  def initialize(original, converted)
    @original = original
    @converted = converted
  end
end
