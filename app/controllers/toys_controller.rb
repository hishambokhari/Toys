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

    def edit
        @toy = Toy.find(params[:id])
    end

    def update
        @toy = Toy.find(params[:id])
        if @toy.update(params.require(:toy).permit(:name, :description))
            flash[:notice] = "Your toy was updated"
            redirect_to @toy
        else
            render 'edit'
        end
    end
end