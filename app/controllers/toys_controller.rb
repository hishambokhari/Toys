class ToysController < ApplicationController

    def index
    end
    
    def show
        @toy = Toy.find(params[:id])
    end
end