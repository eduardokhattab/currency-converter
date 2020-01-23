# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Currency.create(
	code: "BRL",
	name: "Brazilian Real",
	current_brl_exchange_rate: 1.0
)

Currency.create(
	code: "USD",
	name: "US Dollar",
	current_brl_exchange_rate: 1.0
)

Currency.create(
	code: "EUR",
	name: "Euro",
	current_brl_exchange_rate: 1.0
)

Currency.create(
	code: "MXN",
	name: "Mexican Peso",
	current_brl_exchange_rate: 1.0
)

Country.create title: "Brazil", currency_id: Currency.find_by_code("BRL").id
Country.create title: "United States", currency_id: Currency.find_by_code("USD").id
Country.create title: "Germany", currency_id: Currency.find_by_code("EUR").id
Country.create title: "Mexico", currency_id: Currency.find_by_code("MXN").id
