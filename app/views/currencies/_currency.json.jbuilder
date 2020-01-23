json.extract! currency, :id, :code, :name, :current_brl_exchange_rate, :created_at, :updated_at
json.url currency_url(currency, format: :json)
