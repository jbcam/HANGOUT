class Category < ApplicationRecord
  has_many :users
  has_many :events

  validates :name, :picto, presence: true
end
