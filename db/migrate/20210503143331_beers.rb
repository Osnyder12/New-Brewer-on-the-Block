class Beers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :name, null: false
      t.string :description
      t.decimal :abv, null: false
      t.string  :image_url
      t.integer :ibu
      t.decimal :ph, null: false
      t.decimal :beer_volume_value, null: false
      t.string :beer_volume_unit, null: false
      t.decimal :boil_volume_value, null: false
      t.string :boil_volume_unit, null: false

      t.timestamps null: false
    end
  end
end
