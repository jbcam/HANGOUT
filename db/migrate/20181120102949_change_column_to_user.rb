class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :status, 1
  end
end
