class AddExternalRecipeToBeers < ActiveRecord::Migration[5.2]
  def up
    add_column :beers, :external_recipe, :boolean, default: false
  end

  def down
    remove_column :beers, :external_recipe
  end
end
