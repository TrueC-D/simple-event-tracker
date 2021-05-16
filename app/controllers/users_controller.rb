class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        # check if valid before create
        # valid should check if the params are blank or not, and they should only permit certain keys (key restriction is specified in user params)
        @user = User.new(user_params)

        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(session[:user_id])
        else
            flash[:errors] =  @user.errors.full_messages
            redirect_to controlller: 'users', action: 'new'
        end
        
        # if params[:user][:password]
        #     if @user.save
        #         session[:user_id] = @user.id
        #         redirect_to user_path(session[:user_id])
        #     else
        #         redirect_to controller: 'users', action: 'new'
        #         # there was an error processing your request
        #     end

        # else
        #     redirect_to controlller: 'users', action: 'new'
        #     # Error: password and/or username is invalid
        # end
    end

    def show
        if session[:user_id] 
            find_user
        else
            redirect_to signin_path
        end
    end

    def edit
        current_user = session[:user_id]
        if current_user
            if params[:id] == current_user
                find_user
            else
                # error, you do not have access to this page
                redirect_to user_path(current_user)
            end
            # error, you must sign in to access this page
            render signin_path
                
        end
        # can create method for the above code as it will need to be repeated
        # check if logged in & if user exists
    end

    def update
        find_user
        # check if logged in & if user exists
        # check if valid
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy
        find_user
        # check if logged in & if user exists
        # check if valid
        @user.destroy
        # also destorys all attending events that contains the user_id
    end

    def find_user
        @user = User.find_by(id: params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :admin, :password)
        # if params[username]
        #     params.require(:user).permit(:name, :username, :admin, :password)
        # elsif auth[:uid]
        #     auth.permit(:uid, :name)
        # end
    end
end
