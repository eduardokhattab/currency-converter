class ConverterFactory
	def initialize(options={})
		@to   = options[:to]
		@from =	options[:from]
	end

	def build
		Converter.new(@to, @from.map { |from| FromFactory.new(from).build })
	end
end

# converters =
# 	{
# 		from: [
# 			{
# 				country: "mexico"
# 				values: [200, 300]
# 			},
# 			{
# 				country: "usa"
# 				values: [200, 300]
# 			}
# 		]
# 		to: "brazil"
# 	}

## Send on BRL
# {
# 	conversion_results: [
# 		{
# 			base_country: "mexico",
# 			exchange_rates: [
# 					{
# 						original: {
# 							value: 200,
# 							currency: "MXN"
# 						},
# 						converted: {
# 							value: 300,
# 							currency: "BRL"
# 						}
# 					},
# 					{
# 						original: {
# 							value: 300,
# 							currency: "MXN"
# 						},
# 						converted: {
# 							value: 400,
# 							currency: "BRL"
# 						}
# 					}
# 			]
# 		},
# 		{
# 			base_country: "usa",
# 			exchange_rates: [
# 					{
# 						original: {
# 							value: 200,
# 							currency: "usd"
# 						},
# 						converted: {
# 							value: 300,
# 							currency: "BRL"
# 						}
# 					},
# 					{
# 						original: {
# 							value: 300,
# 							currency: "usd"
# 						},
# 						converted: {
# 							value: 400,
# 							currency: "BRL"
# 						}
# 					}
# 			]
# 		}
# 	]
# }
