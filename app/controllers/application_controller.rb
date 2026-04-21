class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  # Make current_user available in views
  helper_method :current_user

  # Get logged-in user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end