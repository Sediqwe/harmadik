class ArticlesController < ApplicationController

    def show
        @data = Article.find(params[:id])
    end

    def index
        @data = Article.all
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        @article.save;

        redirect_to article_path(@article)      
        
       
    end

    def new

    end

    




end
