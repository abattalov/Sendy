class ScorecardsController < ApplicationController

    def index
        @scorecards = Scorecard.all
    end

    def show
        @scorecard = Scorecard.find_by(id: params[:id])
    end

    def new
        @scorecard = Scorecard.new
    end

    def create
        @scorecard = Scorecard.create(scorecard_params(params_array))
        redirect_to @scorecard
    end

    def edit
        @scorecard = Scorecard.find_by(id: params[:id])
    end

    def update
        @scorecard = Scorecard.find_by(id: params[:id])
        @scorecard.update(scorecard_params(params_array))
        redirect_to @scorecard
    end

    def destroy
        @scorecard = Scorecard.find_by(id: params[:id])
        @scorecard.destroy
        redirect_to scorecards_path
    end

    private

    def scorecard_params(array_args)
        params.require(:scorecard).permit(array_args)
    end

    def params_array
        [:course, :date, :strokes, :score]
    end

end
