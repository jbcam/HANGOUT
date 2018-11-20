class Badge < ApplicationRecord
  has_many :users

  validates :logo, :name, presence: true
end
