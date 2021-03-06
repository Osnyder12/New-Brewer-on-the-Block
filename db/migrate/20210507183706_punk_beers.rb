class PunkBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :punk_beers do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.float :abv, null: false
      t.string :image_url
      t.float :ibu
      t.float :ph
      t.float :beer_volume_value, null: false
      t.string :beer_volume_unit, null: false
      t.float :boil_volume_value, null: false
      t.string :boil_volume_unit, null: false
      t.float :mash_temp_value
      t.string :mash_temp_unit
      t.float :mash_temp_duration
      t.float :fermentation_value
      t.string :fermentation_unit

      t.timestamps null: false
    end
  end
end
