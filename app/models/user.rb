class User < ApplicationRecord
  has_many :my_events, class_name: 'Event'
  has_many :user_events
  has_many :attended_event, through: :user_events, source: :event
end
