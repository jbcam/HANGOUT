class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :badge, foreign_key: true
    add_reference :users, :category, foreign_key: true
  end
end
