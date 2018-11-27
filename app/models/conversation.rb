class Conversation < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"

  has_many :messages, as: :messageable, dependent: :destroy

  def unread_messages(user)
    count = messages.count { |message| !message.read && message.user != user }
    count.nil? ? 0 : count
  end
end
