class Message < ApplicationRecord
  belongs_to :messageable, polymorphic: true, optional:true
  belongs_to :user
end
