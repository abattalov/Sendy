class DiscsController < ApplicationController
    # before_action :get_scorecard, only: [:show, :edit, :update, :destroy]
    # before_action :authenticate_user!, except: [:index, :show]
    # before_action :correct_user, only: [:edit, :update, :destroy]

    def index
       if params[:bag_id]
        @bag = Bag.find_by(params[:bag_id])
        @discs = @bag.discs
       else
        @discs = Disc.all
       end
    end

    def show
        @disc = Disc.find_by(id: params[:id])
    end

    def new
        @disc = current_user.bags.discs.build_disc()
    end

    def create
        @disc = current_user.discs.build(disc_params(params_array))
        if @disc.save
            redirect_to disc_path(@disc)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @disc.update(disc_params(params_array))
        if @disc.save
            redirect_to @disc
        else
            render :edit
        end
        
    end

    def destroy
        @disc.destroy
        redirect_to discs_path
    end

    

    private

    def correct_user
        @disc = current_user.discs.find_by(id: params[:id])
        redirect_to discs_path, notice: "Not authorized to edit this disc" if @disc.nil?
    end

    def get_scorecard
        @disc = Disc.find_by(id: params[:id])
    end

    def disc_params(array_args)
        params.require(:disc).permit(array_args)
    end

    def params_array
        [:brand, :plastic, :weight, :bag_id, :speed, :glide, :turn, :fade, :disc_name]
    end
end
