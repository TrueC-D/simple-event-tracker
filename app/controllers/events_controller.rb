class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def show
        # check if logged in & if user exists
        find_event
    end

    def new
        @event = Event.new
    end

    def create
        # check if user.admin == true
        # sessions controller needed -> check session for user id.
        # check if valid before create
        # valid should check if the params are blank or not, and they should only permit certain keys (key restriction is specified in user params)
        @event = Event.create(event_params)
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
         # sessions controller needed -> check session for user id.
        # check if admin
        # check if valid
        # can only destroy if event is not in the past
        @event.destroy
        # if destroyed, also deletes the associated attending events
    end

    def find_event
        @event = Event.find(id: params[:id])
    end

    private

    def event_params
        params.require(:event).permit(:name, :description,:category_id)
    end
end
