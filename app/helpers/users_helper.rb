module UsersHelper
    def custom_show
        if admin?
            render 'users/admin_show'
        else
            render 'users/reg_show'
        end
    end

    def custom_about
        if logged_in?
            render 'users/about_in_session'
        else
            render 'users/about_out_session'
        end
    end
    
end
