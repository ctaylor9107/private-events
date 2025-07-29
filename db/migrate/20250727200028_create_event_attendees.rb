class CreateEventAttendees < ActiveRecord::Migration[8.0]
  def change
    create_table :event_attendees do |t|
      t.integer :attended_event_id
      t.integer :attendee_id

      t.timestamps
    end
    add_foreign_key :event_attendees, :events, column: :attended_event_id
    add_foreign_key :event_attendees, :users, column: :attendee_id
  end
end
