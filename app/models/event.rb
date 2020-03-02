class Event < ApplicationRecord
    belongs_to :creater, class_name: "User" 
    has_many :attendings, foreign_key: "attended_event_id"
    has_many :attendees, through: :attendings
    validates :title,  presence: true
    validates :date,  presence: true
end
