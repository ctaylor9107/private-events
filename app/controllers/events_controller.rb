class EventsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @future_events = Event.future
        @past_events = Event.past
    end

    def show
        @event = Event.find(params[:id])
        @attendee_info = EventAttendee.new
        @attendees = @event.attendees
    end

    def new
        @event = Event.new
    end

    def create
        @creator = current_user

        @event = Event.new(event_params)
        @event.creator = @creator

        if @event.save
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
        def event_params
            params.require(:event).permit(:name, :location, :date, :time)
        end
end
