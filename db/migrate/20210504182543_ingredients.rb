class Ingredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :ingredient_type
      t.string :name, null: false
      t.float :amount_value
      t.string :amount_unit

      t.timestamps null: false
    end
  end
end
