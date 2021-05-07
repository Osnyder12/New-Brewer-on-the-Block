class PunkYeastIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :punk_yeast_ingredients do |t|
      t.string :ingredient_type
      t.string :name
      t.belongs_to :punk_beer

      t.timestamps null: false
    end
  end
end
