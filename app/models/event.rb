class Event < ApplicationRecord
  has_many :attendees
  has_many :creator, class_name: 'User', through: :attendees
end
