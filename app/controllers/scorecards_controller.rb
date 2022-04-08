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

    def edit
        @scorecard = Scorecard.find_by(id: params[:id])
    end

    def update

    end

    def destroy

    end

    private

    def scorecard_params(array_args)
        params.require(:scorecard).permit(array_args)
    end

    def params_array
        [:course, :dates, :strokes, :score]
    end

end
