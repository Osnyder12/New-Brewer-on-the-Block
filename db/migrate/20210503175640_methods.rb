class Methods < ActiveRecord::Migration[5.2]
  def change
    create_table :methods do |t|
      t.string :twist
      t.integer :mash_temp_value, null: false
      t.string :mash_temp_unit, null: false
      t.integer :mash_temp_duration, null: false
      t.integer :fermentation_value, null: false
      t.string :fermentation_unit, null: false
      t.belongs_to :beer, null: false
    end
  end
end
