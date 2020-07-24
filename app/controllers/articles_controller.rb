class ArticlesController < ApplicationController
    before_action :atricle_read, only: [:show, :edit, :update , :destroy]

    def show
      
    end

    def index
        @article = Article.all
    end

    def edit
      
    end
    def new
        @article = Article.new
    end

    def create
        @article = Article.new(permitke)
        if @article.save;
            flash[:notice]  = "Minden rendben, a felvétel megtörtént"
            redirect_to article_path(@article)      
        else
            render 'new' 
        end
        
       
    end

    def update
      
        if @article.update(permitke)
            flash[:notice] = "Minden rendben, a frissítés működik"
            redirect_to @article
        else
        render 'edit'    
        end
    
    
    end
    def destroy
       
        @article.destroy
       
        redirect_to articles_path
    end
private

def atricle_read
    @article = Article.find(params[:id])
end
   
def permitke
    params.require(:article).permit(:title, :description)


end


    




end
