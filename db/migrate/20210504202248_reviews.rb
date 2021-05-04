class Reviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.integer :difficulty, null: false
      t.string :comment
      t.belongs_to :coffee_shop, null: false
    end
  end
end
