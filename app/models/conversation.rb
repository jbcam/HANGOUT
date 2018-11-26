class Conversation < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"

  has_many :messages, as: :messageable, dependent: :destroy

  def messages?
    messages.size.positive?
  end
end
