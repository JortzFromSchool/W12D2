class Api::SessionsController < ApplicationController
    # [POST] api/users: "users#create" (signup),
    # [POST] api/session: "sessions#create" (login),
    # [DELETE] api/session: "sessions#destroy" (logout)

    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user.nil?
            render json: ["Invalid username or password."], status: 404 
            # render :new
        else    
            login!(@user)
        end
    end

    def destroy
     
        if current_user
            logout!
            render json: {}
        else
            render json: ["No logged in user"], status: 404
        end
    end


end
