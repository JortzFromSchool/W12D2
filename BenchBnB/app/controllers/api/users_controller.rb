class Api::UsersController < ApplicationController

    def create
        # debugger
        @user = User.new(user_params)
        if @user.save
            # debugger
            login!(@user)
            render :show
        else 
            # debugger
            render json: @user.errors.full_messages, status: 422
        end
    end

    def new
        @user = User.new
        render :show
    end

    def show
        @user = User.find(params[:id])
        if @user 
            render :show
        else
            render json: @user.errors.full_messages, status: 404
        end
    end

    private

    def user_params 
        params.require(:user).permit(:username, :email, :password)
    end

end
