require 'net/http'

class ConverterService
	EXCHANGE_RATE_API = "https://api.exchangeratesapi.io/latest?base=BRL".freeze

	def self.convert!(converter)
		converter.from.map do |from|
			country = Country.find_by_title(converter.to) # mexico

			exchange_rates = from.values.map do |value|
				if currency_recently_updated?(country.currency)
					country.currency.current_brl_exchange_rate * value
					ExchangeRate.new(
						Money.new(value, Country.find_by_title(from.country).currency.code),
						Money.new((country.currency.current_brl_exchange_rate / Country.find_by_title(from.country).currency.current_brl_exchange_rate) * value, country.currency.code)
					)
				else
					exchange_rates = JSON.parse(RestClient.new(EXCHANGE_RATE_API).get.body)

					ExchangeRate.new(
						Money.new(value, Country.find_by_title(from.country).currency.code),
						Money.new(
							(country.currency.current_brl_exchange_rate / Country.find_by_title(from.country).currency.current_brl_exchange_rate) * value, country.currency.code)
					)
				end
			end

			ConversionResult.new(from.country, exchange_rates)
		end
	end

	private

	def self.currency_recently_updated?(currency)
		return false
		currency.updated_at > (Time.now - 1.hour)
	end
end
