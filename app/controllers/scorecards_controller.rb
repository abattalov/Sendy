class ScorecardsController < ApplicationController

    before_action :get_scorecard, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    before_action :correct_user, only: [:edit, :update, :destroy]

    def index
        @scorecards = Scorecard.all
    end

    def show
    end

    def new
        # @scorecard = Scorecard.new
        @scorecard = current_user.scorecards.build()
    end

    def create
        # @scorecard = Scorecard.new(scorecard_params(params_array))
        @scorecard = current_user.scorecards.build(scorecard_params(params_array))
        if @scorecard.save
            redirect_to scorecard_path(@scorecard)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @scorecard.update(scorecard_params(params_array))
        if @scorecard.save
            redirect_to @scorecard
        else
            render :edit
        end
        
    end

    def destroy
        @scorecard.destroy
        redirect_to scorecards_path
    end

    

    private

    def correct_user
        @scorecard = current_user.scorecards.find_by(id: params[:id])
        redirect_to scorecards_path, notice: "Not authorized to edit this scorecard" if @scorecard.nil?
    end

    def get_scorecard
        @scorecard = Scorecard.find_by(id: params[:id])
    end

    def scorecard_params(array_args)
        params.require(:scorecard).permit(array_args)
    end

    def params_array
        [:course, :date, :strokes, :score, :user_id]
    end

end
