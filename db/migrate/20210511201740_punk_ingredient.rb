class PunkIngredient < ActiveRecord::Migration[5.2]
  def change
    create_table :punk_ingredients do |t|
      t.string :ingredient_type, null: false
      t.string :name, null: false
      t.float :amount_value
      t.string :amount_unit
      t.string :add_time

      t.belongs_to :punk_beer, null: false
    end
  end
end
