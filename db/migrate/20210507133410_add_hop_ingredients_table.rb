class AddHopIngredientsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :hop_ingredients do |t|
      t.string :ingredient_type
      t.string :hop_ingredients, array: true, default: []
      t.belongs_to :beer

      t.timestamps null: false
    end
  end
end
