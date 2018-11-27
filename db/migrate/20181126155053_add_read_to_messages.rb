class AddReadToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :read, :boolean, null: false, default: false
  end
end
