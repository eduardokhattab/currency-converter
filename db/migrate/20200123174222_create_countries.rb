class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
    	t.belongs_to :currency

      t.string :title

      t.timestamps
    end
  end
end
