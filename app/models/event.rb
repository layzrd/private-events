class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :user_events
  has_many :attendee, through: :user_events, source: :user
end
