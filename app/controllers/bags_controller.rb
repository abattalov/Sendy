class BagsController < ApplicationController
    
    before_action :get_bag, only: [:show, :edit, :update, :destroy, :add]
    before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update, :destroy]

    def index
        if current_user
            @bags = current_user.bags
        end
    end

    def show

    end

    def new
        @bag = Bag.new
        3.times {@bag.discs.build}
    end

    def create
        @bag = current_user.bags.build(bag_params(params_array))
        if @bag.save
            redirect_to bag_path(@bag)
        else
            render :new
        end
    end

    def edit
    end

    def add
    end

    def add_create
        @bag = current_user.bags.find(params[:bag_id])
        @disc = Disc.new(disc_params(disc_params_array))
        @bag.discs << @disc
        if @bag.save
            redirect_to @bag
        else
            render :add
        end
    end

    def update
        @bag.update(bag_params(params_array))
        if @bag.save
            redirect_to @bag
        else
            render :edit
        end
        
    end

    def destroy
        @bag.destroy
        redirect_to bags_path
    end

    def disc_destroy
        @bag.disc.destroy
        redirect_to @bag
    end

    

    private

    def correct_user
        @bag = current_user.bags.find_by(id: params[:id])
        redirect_to bags_path, notice: "Not authorized to edit this bag" if @bag.nil?
    end

    def get_bag
        @bag = Bag.find_by(id: params[:id])
    end

    def bag_params(array_args)
        params.require(:bag).permit(array_args)
    end

    def params_array
        [:user_id, :disc_id, :name, discs_attributes: [:id, :disc_name, :brand, :plastic, :weight, :speed, :glide, :turn, :fade, :bag_id]]
    end

    def disc_params(array_args)
        params.require(:disc).permit(array_args)
    end

    def disc_params_array
        [:brand, :plastic, :weight, :bag_id, :speed, :glide, :turn, :fade, :disc_name]
    end
end
