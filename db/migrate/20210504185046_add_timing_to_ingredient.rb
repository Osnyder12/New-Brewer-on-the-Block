class AddTimingToIngredient < ActiveRecord::Migration[5.2]
  def up
    add_column :ingredients, :add_time, :string
  end

  def down
    remove_column :ingredients, :add_time
  end
end
