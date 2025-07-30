class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :event_attendees, foreign_key: "attended_event_id"
    has_many :attendees, through: :event_attendees

    # def self.past
    #     where(date: ..Time.now.midnight)
    # end

    # def self.future
    #     where(date: Time.now.midnight..)
    # end

    scope :past, -> { where(date: ..Time.now.midnight) }
    scope :future, -> { where(date: Time.now.midnight..) }
end


