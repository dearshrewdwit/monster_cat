class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :authenticate_user!

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def authenticate_user!
    unless logged_in?
       flash[:danger] = "Please log in."
       redirect_to root_path
    end
  end
end
