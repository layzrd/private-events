class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
             # belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :attendees
  has_many :users, through: :attendees
end
