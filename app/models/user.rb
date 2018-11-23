class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum status: { unavailable: 0, available: 1 }
  belongs_to :category
  has_many :events

  validates :first_name, :last_name, :email, presence: true

  mount_uploader :avatar, PhotoUploader

end
