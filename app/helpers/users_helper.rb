module UsersHelper
    def custom_show
        if admin?
            render 'users/admin_show'
        else
            render 'users/reg_show'
        end
    end
    
end
