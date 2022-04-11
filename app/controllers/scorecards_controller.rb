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
        @scorecard = Scorecard.new(scorecard_params(params_array))
        if @scorecard.save
            redirect_to scorecard_path(@scorecard)
        else
            render :new
        end
    end

    def edit
        @scorecard = Scorecard.find_by(id: params[:id])
    end

    def update
        @scorecard = Scorecard.find_by(id: params[:id])
        @scorecard.update(scorecard_params(params_array))
        if @scorecard.save
            redirect_to @scorecard
        else
            render :edit
        end
        
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
