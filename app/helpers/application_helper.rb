module ApplicationHelper
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def authentication_required
        if !logged_in?
            redirect_to signin_path
        end
    end

    def admin?
        if logged_in?
            return current_user.admin
        end
    end

    def custom_buttons
        if !!logged_in?
            render 'layouts/nav_bar_in_session'
        else
            render 'layouts/nav_bar_out_session'
        end
    end

    def admin_buttons?
        if admin?
            render 'layouts/nav_bar_admin'
        end
    end

    def not_admin_error
    end

    def not_logged_in_error
    end

    def not_correct_user_error
    end

    def failed_to_authenticate
        flash.alert = "Failed to Authenticate."
    end
end
