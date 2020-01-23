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

