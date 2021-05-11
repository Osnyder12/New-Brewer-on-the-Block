class PunkMashes < ActiveRecord::Migration[5.2]
  def change
    create_table :punk_mashes do |t|
      t.float :mash_temp_value
      t.string :mash_temp_unit
      t.float :mash_temp_duration
      t.float :fermentation_value
      t.string :fermentation_unit
      t.belongs_to :punk_beer
    end
  end
end
