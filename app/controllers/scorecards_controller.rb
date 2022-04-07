class ScorecardsController < ApplicationController

    def index
        @scorecards = Scorecard.all
    end

    def show
        @scorecard = Scorecard.find_by(id: params[:id])
    end
end
