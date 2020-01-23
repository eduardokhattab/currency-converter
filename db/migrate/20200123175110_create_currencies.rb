class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
    	t.belongs_to :country

      t.string :code
      t.string :name
      t.decimal :current_brl_exchange_rate
      t.datetime :updated_at

      t.timestamps
    end
  end
end
