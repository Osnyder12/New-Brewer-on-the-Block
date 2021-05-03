class Amounts < ActiveRecord::Migration[5.2]
  def change
    create_table :amounts do |t|
      t.belongs_to :beer, null: false
      t.belongs_to :ingredient, null: false

      t.decimal :value
      t.string :unit, null: false
    end
  end
end
