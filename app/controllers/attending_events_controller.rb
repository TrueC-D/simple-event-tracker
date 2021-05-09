class AttendingEventsController < ApplicationController
    # def index
    # end

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

    def at_event_params
        params.permit(:user_id, :event_id)
    end 
end
