class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    def current_user
        @current_user ||= User.find( session[:user_id]) if session[:user_id]
    end
    def logged_in?
        !!current_user
    end
    def required_user
        if !logged_in?
            flash[:alert] = "Ennek a funkciónak a használatához be kell jelentkezz"
            redirect_to belepes_path
        end
    end
end
