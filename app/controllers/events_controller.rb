class EventsController < ApplicationController
    helper EventsHelper
    def index
        @events = Event.all
    end

    def show
        # check if logged in & if user exists
        find_event
        @at_events = AttendingEvent.where(event_id: params[:id])        
    end

    def new
        @event = Event.new
    end

    def create
        # check if user.admin == true
        # sessions controller needed -> check session for user id.
        # check if valid before create
        # valid should check if the params are blank or not, and they should only permit certain keys (key restriction is specified in user params)
        # params[:datetime] = DateTime.new(params[:'datetime(1i)'], params[:'datetime(2i)'], params[:'datetime(3i)'], params[:'datetime(4i)'], params[:'datetime(5i)'])
        arr = [1,2,3,4,5]
        i= arr.map{|number| params[:event][:"datetime(#{number}i)"].to_i }
        params[:event][:datetime] = DateTime.new(i[0], i[1], i[2], i[3], i[4])
        @event = Event.create(event_params)
        redirect_to event_path(@event)
    end

    def edit
        # sessions controller needed -> check session for user id.
        # check if admin
        find_event
    end

    def update
        find_event
         # sessions controller needed -> check session for user id.
        # check if admin
        # check if valid
        @event.update(event_params)
        redirect_to event_path(@event)
    end

    def destroy
        find_event
        if future_date?
            @event.destroy
            redirect_to events_path
        else
            flash[:error] = "Could not delete #{@event.name}"
            redirect_to event_path(@event)
        end
         # sessions controller needed -> check session for user id.
        # check if admin
        # check if valid
        # can only destroy if event is not in the past
        # if destroyed, also deletes the associated attending events
    end

   

    private

    def future_date?
        if @event.datetime > DateTime.now
           return true
        else
           return false
        end
        
    end#

    def find_event
        @event = Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(:name, :description, :category_id, :datetime)
    end
end
