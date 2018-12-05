class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :user, uniqueness: { scope: :event}
end
