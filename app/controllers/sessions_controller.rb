class SessionsController < ApplicationController
    def new
    end

    def create
        if auth['uid']
            @user = User.find_or_create_by(uid: auth['uid']) do |u|
                u.name = auth['info']['name']
                session_setup
            end
        elsif @user = User.find(params[:user][:username])
            if @user && @user.authenticate(params[:password])
                session_setup
                # error, credentials did not match.
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