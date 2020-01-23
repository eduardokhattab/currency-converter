class FromFactory

	def initialize(options={})
		@country = options[:country]
		@values  = options[:values]
	end

	def build
		From.new(@country, @values)
	end
end
