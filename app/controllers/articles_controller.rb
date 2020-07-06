class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])
    end

    def index
        @article = Article.all
    end

    def edit
        @article = Article.find(params[:id])

    
    end


    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save;
            flash[:notice]  = "Minden rendben, a felvétel megtörtént"
            redirect_to article_path(@article)      
        else
            render 'new' 
        end
        
       
    end

    def new
        @article = Article.new
    end

    




end
