class Attending < ApplicationRecord
    belongs_to :attended_event, class_name: "Event"
    belongs_to :attendee, class_name: "User"

    validates :attended_event_id,  presence: true
    validates :attendee_id,  presence: true

end
