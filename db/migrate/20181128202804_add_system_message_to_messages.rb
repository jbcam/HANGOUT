class AddSystemMessageToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :system_message, :boolean, null: false, default: false
  end
end
