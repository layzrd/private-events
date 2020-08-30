class User < ApplicationRecord
  has_many :my_events, class_name: 'Event'
  has_many :attendees
  has_many :events, through: :attendees
end