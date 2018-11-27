class Event < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :attendees
  has_many :messages, as: :messageable
  has_many :messages, as: :messageable, dependent: :destroy

  validates :name, :description, :address, presence: true

  include PgSearch
  pg_search_scope :search_events_by_category_id,
    #against: [:category_id],
    associated_against: {
      category: [:name]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
