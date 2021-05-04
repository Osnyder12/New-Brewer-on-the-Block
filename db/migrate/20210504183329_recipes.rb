class Recipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.belongs_to :beer
      t.belongs_to :ingredient
    end
  end
end
