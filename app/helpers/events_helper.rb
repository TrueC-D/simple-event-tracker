module EventsHelper
    
    def future_date?
        if @event.datetime > DateTime.now
           return true
        else
           return false
        end
        # this method may not be needed -> doesn't work in controllers?
    end

    def get_errors
        if flash[:errors]
            flash[:errors].each do |msg|
                content_tag(:div, "Error: #{msg}", class: 'alert')
                content_tag(:br)
            end
        end
    end



    def custom_show_form
        if @event.datetime > DateTime.now
            if admin?
                render 'events/admin_event_links'
            else
                if @attending
                    button_to 'Cancel Booking', event_attending_event_path(@event, @attending), method: 'delete'
                else
                    button_to "Create Booking", new_event_attending_event_path(@event), method: 'get'
                end
            end
        else
            'Cannot make changes to a past event.'
        end
    end
end
