class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
    helper_method :current_user

    protected
    
    def authenticate
        unless current_user
            redirect_to new_session_path,
            alert: 'You need to sign in or sign up before continuing.'
        end
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
