class EventsController < ApplicationController
    before_action :authenticate_user!, except: [:index]

    def index
        @events = Event.all
    end

    def new
        @event = Event.new
    end

    def create
        @creator = current_user

        @event = Event.new(event_params)
        @event.creator = @creator

        if @event.save
            redirect_to show_user_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
        def event_params
            params.require(:event).permit(:name, :location, :date, :time)
        end
end
