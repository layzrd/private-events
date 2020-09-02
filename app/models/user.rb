class User < ApplicationRecord
  validates :name, presence: true
  validates :username, presence: true

  scope :select_specific_fields, -> { pluck('users.name, events.location, events.description, events.event_date') }
  scope :join_event, -> { joins(user_events: :event) }

  has_many :my_events, class_name: 'Event'
  has_many :user_events
  has_many :attended_event, through: :user_events, source: :event

  def self.upcoming_events
    join_event.where('event_date >= ?', Date.today.to_s(:db)).select_specific_fields
  end

  def self.previously_attended_events
    join_event.where('event_date < ?', Date.today.to_s(:db)).select_specific_fields
  end
end
