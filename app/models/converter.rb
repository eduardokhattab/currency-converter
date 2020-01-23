class Converter
	attr_reader :to, :from

	def initialize(to, from)
		@to = to
		@from = from
	end
end
