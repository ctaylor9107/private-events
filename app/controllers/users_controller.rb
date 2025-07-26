class UsersController < ApplicationController
    def show
        @user = current_user
        @events = Event.where(creator_id: @user.id)
    end
end
