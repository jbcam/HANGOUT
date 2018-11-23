class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.integer  "sender_id"
      t.integer  "recipient_id"

      t.timestamps
    end
    add_index "conversations", ["recipient_id"], name: "index_conversations_on_recipient_id", using: :btree
    add_index "conversations", ["sender_id"], name: "index_conversations_on_sender_id", using: :btree
  end
end
