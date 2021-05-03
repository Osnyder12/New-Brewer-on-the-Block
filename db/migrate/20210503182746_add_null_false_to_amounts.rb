class AddNullFalseToAmounts < ActiveRecord::Migration[5.2]
  def change
    change_column_null :amounts, :value, false
  end
end
