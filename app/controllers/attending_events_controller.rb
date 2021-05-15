class AttendingEventsController < ApplicationController
    def index
        if params[:event_id]
            parent_event
            @at_event = @event.attending_events
        else 
            @at_event = AttendingEvent.all
        end
    end

    def show
        @at_event = AttendingEvent.find(params[:id])
        parent_event
        # necessary
    end

    def new
        @at_event = AttendingEvent.new
        parent_event
        @user = current_user
        # necessary
    end

    def create
        # if @at_event.user_id == session id.  Admin should not be able to create instance but can destroy it.
        @at_event = AttendingEvent.create(at_event_params)
    end


    def destroy
        # if admin == true or if @at_event.user_id == session id
        @at_event = AttendingEvent.find(id: params[:id])
        @at_event.destroy
    end

    private

    def parent_event
        @event = Event.find(params[:event_id])
    end

    def at_event_params
        params.permit(:user_id, :event_id, :category_id)
    end 
end
