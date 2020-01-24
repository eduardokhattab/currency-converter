class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string :code
      t.string :name
      t.decimal :current_brl_exchange_rate, precision: 12, scale: 2, default: 0.0
      t.datetime :updated_at

      t.timestamps
    end
  end
end
