class Beers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.float :abv, null: false
      t.string :image_url
      t.float :ibu, null: false
      t.float :ph, null: false
      t.float :beer_volume_value, null: false
      t.string :beer_volume_unit, null: false
      t.float :boil_volume_value, null: false
      t.string :boil_volume_unit, null: false

      t.timestamps null: false
    end
  end
end
