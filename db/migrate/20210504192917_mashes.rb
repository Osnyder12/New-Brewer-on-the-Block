class Mashes < ActiveRecord::Migration[5.2]
  def change
    create_table :mashes do |t|
      t.float :mash_temp_value
      t.string :mash_temp_unit
      t.float :mash_temp_duration
      t.float :fermentation_value
      t.string :fermentation_unit
      t.belongs_to :beer
    end
  end
end
