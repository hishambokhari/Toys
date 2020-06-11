class ToysController < ApplicationController
    before_action :set_toy, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
        @toys = Toy.paginate(page: params[:page], per_page: 5)

    end
    
    def show
        
    end

    def new
        @toy = Toy.new
    end

    def create 
        @toy = Toy.new(toy_params)
        @toy.user = current_user
        if @toy.save
            flash[:notice] = "Toy was created successfully"
            redirect_to @toy
        else
            render 'new'
        end
    end

    def edit
       
    end

    def update
        if @toy.update(toy_params)
            flash[:notice] = "Your Toy card was updated"
            redirect_to @toy
        else
            render 'edit'
        end
    end

    def destroy
        @toy.destroy
        redirect_to @toy
    end

    private

    def toy_params
        params.require(:toy).permit(:name, :description)
    end

    def set_toy
        @toy = Toy.find(params[:id])
    end

    def require_same_user
        if current_user != @toy.user
            flash[:alert] = "You can only edit or delete your own article"
            redirect_to @toy
        end
    end
end