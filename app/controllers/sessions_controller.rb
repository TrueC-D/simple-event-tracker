class SessionsController < ApplicationController
    # skip_before_action :verify_authenticity_token, only: :create
    
    def new
        # if logged in, redirect to user_path(current_user)
    end

    def create
        # if logged in, redirect to user_path(current_user)
        if auth
            binding.pry
            @user = User.find_or_create_by(id: auth['uid']) do |u|
                u.name = auth['info']['name']
                session_setup
            end
        elsif params
            @user = User.find_by(username: params[:username])
            if @user && @user.authenticate(params[:password])
                session_setup
            else
                # error, credentials did not match.
                redirect_to signin_path
                flash[:alert] = "Failed to Authenticate"
            end

        else
            redirect_to signin_path
        end
    end

    def destroy
        reset_session
        redirect_to signin_path
    end

    private

    def auth 
        request.env['omniauth.auth']
    end

    def session_setup
        session[:user_id] = @user.id
        redirect_to user_path(session[:user_id])
    end
end