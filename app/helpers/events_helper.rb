module EventsHelper

    def link_to_events(events)
        unless events.nil? 
          events.each do |e|
              concat content_tag(:li, link_to("#{e.name} - #{e.category.name} - #{e.datetime}", event_path(e)))
                #  concat link_to( "#{e.name} - #{e.category.name} - #{e.datetime}", event_path(e))
                # end
              concat content_tag(:br)
            end
        end

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
