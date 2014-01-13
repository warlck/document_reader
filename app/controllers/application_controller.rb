class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
  	@current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end

  def authenticate_user!
  	 unless current_user
  	 	 redirect_to login_url, alert: "You are not authorized to see this page"
  	 end
  end

  helper_method :current_user
end
