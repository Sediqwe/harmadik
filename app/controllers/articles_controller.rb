class ArticlesController < ApplicationController

    def show
        @data = Article.find(params[:id])
    end

    def index
        @data = Article.all
    end

    def create
    
    end

    




end
