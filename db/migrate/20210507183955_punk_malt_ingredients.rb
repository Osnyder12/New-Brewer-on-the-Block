class PunkMaltIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :punk_malt_ingredients do |t|
      t.string :ingredient_type
      t.string :malt_ingredients, array: true, default: []
      t.belongs_to :punk_beer

      t.timestamps null: false
    end
  end
end
