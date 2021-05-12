class PunkReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :punk_reviews do |t|
      t.integer :rating, null: false
      t.integer :difficulty, null: false
      t.string :comment
      t.belongs_to :punk_beer, null: false
    end
  end
end