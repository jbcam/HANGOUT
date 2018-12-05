class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum status: { unavailable: 0, available: 1 }
  belongs_to :category, optional: true
  has_many :attendees
  has_many :events, through: :attendees
  has_many :hosted_events
  has_many :sender_conversations, class_name: "Conversation", foreign_key: "sender_id", dependent: :destroy
  has_many :recipient_conversations, class_name: "Conversation", foreign_key: "recipient_id", dependent: :destroy

  include PgSearch
  pg_search_scope :search_users_by_category_id,
    #against: [:category_id],
    associated_against: {
      category: [:name]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

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

  def unread_conversations
    sent = sender_conversations.count { |conversation| conversation.unread_messages(self).positive? }
    rec = recipient_conversations.count { |conversation| conversation.unread_messages(self).positive? }
    ev = events.count { |event| event.unread_messages(self).positive? }
    sent + rec + ev
  end

  def channels_id
    channels = sender_conversations + recipient_conversations + events
    channels.map(&:id).to_json
  end

  def attendee?(event)
    events.include? event
  end

  def attendee(event)
    attendees.where(event: event).first
  end
end
