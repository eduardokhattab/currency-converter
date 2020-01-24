class ConversionResult
  attr_reader :base_country, :exchange_rates

  def initialize(base_country, exchange_rates)
    @base_country = base_country
    @exchange_rates = exchange_rates
  end
end
