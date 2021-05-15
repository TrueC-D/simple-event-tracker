module EventsHelper
    def custom_show_form
        if @event.datetime > DateTime.now
            if admin?
                render 'events/admin_event_links'
            else
                user_is_attending = @event.attending_events.find_by(user_id: current_user)
                if user_is_attending
                    button_to 'Cancel Booking', attending_events_path, method: 'delete'
                else
                    render 'events/new_attendee'
                end
            end
        else
            'Cannot make changes to a past event.'
        end
    end
end
