class Event < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :attendees

  validates :name, :description, :address, presence: true
end
