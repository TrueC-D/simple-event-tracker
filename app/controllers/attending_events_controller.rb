class AttendingEventsController < ApplicationController
    def index
        parent_event
        @at_events = @event.attending_events
    end

    def show
        find_ticket
        @user = User.find(@at_event.user_id)
        parent_event
    end

    def new
        @at_event = AttendingEvent.new
        parent_event
        @user = current_user        
    end

    def create
        # if @at_event.user_id == session id.  Admin should not be able to create instance but can destroy it. -> edit: maybe i don't care so much about this, won't include
        @at_event = AttendingEvent.new(at_event_params)
        @event = Event.find(params[:event_id])
        if @at_event.valid?
            @at_event.save
            redirect_to event_attending_event_path(@event, @at_event)
        else 
            flash[:errors] = @at_event.errors.full_messages
            render new_event_attending_event_path(@event)
            # tested validation with the following code in console:
            # document.getElementById('attending_event_status_id').value = 0
        end
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
        params.require(:attending_event).permit(:user_id, :event_id, :status_id, :expectation)
    end 
end
