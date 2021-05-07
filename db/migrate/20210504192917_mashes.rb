class Mashes < ActiveRecord::Migration[5.2]
  def change
    create_table :mashes do |t|
      t.string :mash_temp, array: true, default: []
      t.float :fermentation_value
      t.string :fermentation_unit
      t.belongs_to :beer
    end
  end
end
