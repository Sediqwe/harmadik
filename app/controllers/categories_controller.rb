class  CategoriesController < ApplicationController
    before_action :require_admin, except: [:index, :show]
    def show
        @category = Category.find(params[:id])
    end
    def new 
        @category = Category.new

    end

    def index
        @categories = Category.paginate(page: params[:page], per_page: 2)
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:notice] = "A kategória felvéve"
            redirect_to @category
        else
            render 'new'
            
        end
        
    end


    private
    def category_params
        params.require(:category).permit(:name )
    end

    def require_admin
        if !(logged_in? && current_user.admin?)
        flash[:alert] = "Ezt csak admin userek használhatják"
        redirect_to categories_path
        
        end

    end

       
    
end


