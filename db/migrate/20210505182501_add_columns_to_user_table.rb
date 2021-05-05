class AddColumnsToUserTable < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :role, :string, null: false, default: "member"
  end

  def down
    remove_column :users, :role
  end
end
