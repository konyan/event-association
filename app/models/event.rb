class Event < ApplicationRecord
  belongs_to :creater, class_name: 'User'
  has_many :attendings, foreign_key: 'attended_event_id'
  has_many :attendees, through: :attendings

  scope :upcoming_event, -> { where('date > ?', Time.now) }
  scope :previous_event, -> { where('date <= ?', Time.now) }

  validates :title, presence: true
  validates :date, presence: true
  validates :place, presence: true
  validates :description, presence: true
end
