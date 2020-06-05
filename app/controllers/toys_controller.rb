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
        if @toy.save
            flash[:notice] = "Toy was created successfully"
            redirect_to @toy
        else
            render 'new'
        end
    end
end