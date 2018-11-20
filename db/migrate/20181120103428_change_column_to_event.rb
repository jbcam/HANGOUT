class ChangeColumnToEvent < ActiveRecord::Migration[5.2]
  def change
    change_column_default :events, :private, false
  end
end
