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
    def new
        @article = Article.new
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

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Minden rendben, a frissítés működik"
            redirect_to @article
        else
        render 'edit'    
        end
    
    
    end
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
       
        redirect_to articles_path
    end

   

    




end
