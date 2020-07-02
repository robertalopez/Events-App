class ApplicationController < ActionController::Base
    before_action :authorized
    helper_method :session_user
    helper_method :logged_in?

    def session_user    
        @user = User.find_by(id: session[:user_id])  
    end

    def logged_in?
       
        !session_user.nil?  
    end

    def authorized
        redirect_to '/welcome' unless logged_in?
     end
end
