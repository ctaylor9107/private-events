class UsersController < ApplicationController
    def show
        @user = current_user
        @created_events = Event.where(creator_id: @user.id)
        @attending_events = @user.attended_events
    end
end
