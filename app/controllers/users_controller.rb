class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :destroy, :show, :update]
   
    def index
    @user = User.paginate(page: params[:page], per_page: 3)
   end
    
   
    def show
    
    @article = @user.articles.paginate(page: params[:page], per_page: 2)
end
def destroy
    
    adatok = @user.username
    @user.destroy
    flash[:notice] = adatok + " törlésre került!"
    redirect_to users_path

end

def edit
    
   end

def update
    
    if @user.update(permitke)
        flash[:notice] = "A módosítás sikeresen megtörtént!"
        redirect_to @user
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
        session[:user_id] = @user.id
        flash[:notice]  = "Minden rendben, a felvétel megtörtént"
        redirect_to '/regisztralas'     
    else
        render 'new' 
    end
end
private
def permitke
    params.require(:user).permit(:username, :email, :password )
end
def set_user
    @user = User.find(params[:id])
end
end