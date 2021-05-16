class AttendingEventsController < ApplicationController
    def index
        # if params[:event_id]
            parent_event
            @at_events = @event.attending_events
        # else 
            # @at_event = AttendingEvent.all
        # end
        # necessary
    end

    def show
        find_ticket
        @user = User.find(@at_event.user_id)
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
        @event = Event.find(params[:event_id])
        redirect_to event_attending_event_path(@event, @at_event)
    end


    def destroy
        # if admin == true or if @at_event.user_id == session id
        find_ticket
        @at_event.destroy
        parent_event
        redirect_to event_path(@event)
    end

    private

    def current_user
        User.find(session[:user_id])
    end

    def parent_event
        @event = Event.find(params[:event_id])
    end

    def find_ticket
        @at_event = AttendingEvent.find(params[:id])
    end

    def at_event_params
        params.require(:attending_event).permit(:user_id, :event_id, :status_id)
    end 
end
