class PunkHopIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :punk_hop_ingredients do |t|
      t.string :ingredient_type
      t.string :hop_ingredients, array: true, default: []
      t.belongs_to :punk_beer

      t.timestamps null: false
    end
  end
end
