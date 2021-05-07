class YeastIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :yeast_ingredients do |t|
      t.string :ingredient_type
      t.string :name
      t.belongs_to :beer

      t.timestamps null: false
    end
  end
end
