class UsersController < ApplicationController
  
   
    def index
    @user = User.all
   end
    
   
    def show
    @user = User.find(params[:id])
    @article = @user.articles
end
def destroy
    @user = User.find(params[:id])
    adatok = @user.username
    @user.destroy
    flash[:notice] = adatok + " törlésre került!"
    redirect_to users_path

end

def edit
    @user = User.find(params[:id])
   end

def update
    @user = User.find(params[:id])
    if @user.update(permitke)
        flash[:notice] = "A módosítás sikeresen megtörtént!"
        redirect_to users_path
    else
    render 'edit'    
    end


end
    def new
   @user = User.new
end
def create
    @user = User.new(permitke)
     if @user.save;
        flash[:notice]  = "Minden rendben, a felvétel megtörtént"
        redirect_to '/regisztralas'     
    else
        render 'new' 
    end
end
def permitke
    params.require(:user).permit(:username, :email, :password )


end
end