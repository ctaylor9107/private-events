class EventAttendee < ApplicationRecord
  belongs_to :attended_event, class_name: "Event"
  belongs_to :attendee, class_name: "User"
  validates :attended_event_id, uniqueness: { scope: :attendee_id, message: "This combination already exists." }
end
