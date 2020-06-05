class ToysController < ApplicationController

    def index
        @toys = Toy.all
    end
    
    def show
        @toy = Toy.find(params[:id])
    end

    def new
        @toy = Toy.new
    end

    def create 
        @toy = Toy.new(params.require(:toy).permit(:name, :description))
        @toy.save
        redirect_to @toy
    end
end