require 'net/http'

class ConverterService

	def self.convert!(converter)
		converter.from.each do |from|
			country = Country.find_by_title(converter.to)

			from.values.each do |value|
				if country.present?
					valor_convertido = country.currency.current_brl_exchange_rate * value
				else
				  uri = URI("https://api.exchangeratesapi.io/latest?base=BRL")
				  http = Net::HTTP.new(uri.host, uri.port)
				  http.use_ssl = true

				  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})

				  response = http.request(request)

				  return JSON.parse(response.body)
				end
			end
		end
	end
end