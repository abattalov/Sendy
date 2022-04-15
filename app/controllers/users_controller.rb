class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    def new  
    end

    def destroy
        @user.destroy
        redirect_to users_path
    end
end
