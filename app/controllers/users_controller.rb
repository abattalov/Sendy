class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def show
        @user = User.find_by(id: params[:id])
        @scorecard = Scorecard.find_by(user_id: params[:id])
        @bag = Bag.find_by(user_id: params[:id])
    end

    def new  
    end

    def destroy
        @user.destroy
        redirect_to users_path
    end
end
