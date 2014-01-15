class ApplicationController < ActionController::Base
  protect_from_forgery

  def login user, permanent = false
     if permanent  
        cookies.permanent[:auth_token] = user.auth_token
     else
        cookies[:auth_token] = user.auth_token
     end
   end

  def current_user
  	@current_user ||=  if cookies[:auth_token] 
                         User.find_by_auth_token(cookies[:auth_token])
                       else
                         user = User.new_guest
                         cookies[:auth_token] = user.auth_token
                         user
                       end

  end

  def authenticate_user!
  	 unless current_user
  	 	 redirect_to login_url, alert: "You are not authorized to see this page"
  	 end
  end

  helper_method :current_user
end
