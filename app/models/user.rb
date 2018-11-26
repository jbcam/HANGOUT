class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum status: { unavailable: 0, available: 1 }
  belongs_to :category, optional: true
  has_many :events
  has_many :sender_conversations, class_name: "Conversation", foreign_key: "sender_id", dependent: :destroy
  has_many :recipient_conversations, class_name: "Conversation", foreign_key: "recipient_id", dependent: :destroy

  #validates :first_name, :last_name, :email, presence: true

  mount_uploader :avatar, PhotoUploader

  def conversation(user)
    # Conversation.where("sender_id = ? OR recipient_id = ?", user.id, user.id).first
    sender_conversations.each do |conversation|
      return conversation if conversation.recipient == user
    end
    recipient_conversations.each do |conversation|
      return conversation if conversation.sender == user
    end
    return nil
  end
end
