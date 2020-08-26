class UsersController < ApplicationController
   def edit
    @user = User.find(params[:id])
   end
   
    def index
    @user = User.all
   end
    
   
    def show
    @user = User.find(params[:id])
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
        flash[:notice]  = "Minden rendben, a felvétel megtörtént"
        redirect_to '/belepes'     
    else
        render 'new' 
    end
end
def permitke
    params.require(:user).permit(:username, :password, :email )


end
end