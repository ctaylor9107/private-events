class EventAttendeesController < ApplicationController
    before_action :authenticate_user!


    def create
        @attendee_info = EventAttendee.new(attendance_params)
        @attendee_info.attendee_id = current_user.id

        if @attendee_info.save
            redirect_to root_path
        else
            flash[:alert] = "Error creating object: #{@attendee_info.errors.full_messages.to_sentence}"
            @events = Event.find(attendance_params[:attended_events_id])
            redirect_to "events/show" #, status: :unprocessable_entity
        end
    end

    private
    def attendance_params
        params.require(:event_attendee).permit(:attended_event_id)
    end

end
