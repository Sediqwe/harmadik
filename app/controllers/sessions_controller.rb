class SessionsController < ApplicationController
def new

end
def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    session[:user_id] = user.id
    flash[:notice] = "Sikeres belépés"
    redirect_to user
    else
        flash.now[:alert]  = "Kérlek add meg a helyes belépési adatokat"
        render 'new'
    end
end
def destroy
    session[:user_id] = nil
    flash[:notice] = "Sikeres kilépés"
    redirect_to root_path
end



end