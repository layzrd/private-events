class Event < ApplicationRecord
  scope :past, -> { where('event_date < ?', Date.today.to_s(:db)) }
  scope :upcoming, -> { where('event_date >= ?', Date.today.to_s(:db)) }
  # Ex:- scope :active, -> {where(:active => true)}
  # Ex:- scope :active, -> {where(:active => true)}
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :user_events
  has_many :attendee, through: :user_events, source: :user

  # def self.past; enwd
end
