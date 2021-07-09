class UsersController < ApplicationController
    def about

    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(session[:user_id])
        else
            flash[:errors] =  @user.errors.full_messages
            render controlller: 'users', action: 'new'
        end
      
    end

    def show
        if session[:user_id] 
            find_user
        else
            redirect_to signin_path
        end
    end

    # def edit
    #     current_user = session[:user_id]
    #     if current_user
    #         if params[:id] == current_user
    #             find_user
    #         else
    #             # error, you do not have access to this page
    #             redirect_to user_path(current_user)
    #         end
    #         # error, you must sign in to access this page
    #         render signin_path
                
    #     end
    #     # can create method for the above code as it will need to be repeated
    #     # check if logged in & if user exists
    # end

    # def update
    #     find_user
    #     # check if logged in & if user exists
    #     # check if valid
    #     @user.update(user_params)
    #     redirect_to user_path(@user)
    # end

    def destroy
        find_user
        # check if logged in & if user exists
        @user.destroy
        # also destorys all attending events that contains the user_id
    end

    

    private

    def find_user
        @user = User.find_by(id: params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :username, :admin, :password)
        # if params[username]
        #     params.require(:user).permit(:name, :username, :admin, :password)
        # elsif auth[:uid]
        #     auth.permit(:uid, :name)
        # end
    end
end
