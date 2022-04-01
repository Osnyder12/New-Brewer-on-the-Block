class Beers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :description
      t.float :abv
      t.string :image_url
      t.float :ibu
      t.float :ph
      t.float :beer_volume_value
      t.string :beer_volume_unit
      t.float :boil_volume_value
      t.string :boil_volume_unit
      t.float :mash_temp_value
      t.string :mash_temp_unit
      t.float :mash_temp_duration
      t.float :fermentation_value
      t.string :fermentation_unit

      t.timestamps null: false
    end
  end
end
