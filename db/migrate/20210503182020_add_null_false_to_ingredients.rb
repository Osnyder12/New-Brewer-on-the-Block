class AddNullFalseToIngredients < ActiveRecord::Migration[5.2]
  def change
    change_column_null :ingredients, :name, false
  end
end
