module EventsHelper
    
    def future_date?
        if @event.datetime > DateTime.now
           return true
        else
           return false
        end
        
    end

    def custom_show_form
        if @event.datetime > DateTime.now
            if admin?
                render 'events/admin_event_links'
            else
                if @at_event
                attending = @event.attending_events.find(user_id: current_user)
                if attending
                    button_to 'Cancel Booking', event_attending_event_path(@event, attending), method: 'delete'
                else
                    button_to "Create Booking", event_attending_events_path(@event)
                end
            end
        else
            'Cannot make changes to a past event.'
        end
    end
end
