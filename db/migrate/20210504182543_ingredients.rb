class Ingredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :ingredient_type, null: false
      t.string :name, null: false
      t.float :amount_value
      t.string :amount_unit
      t.string :add_time
      t.belongs_to :beer, null: false

      t.timestamps null: false
    end
  end
end
