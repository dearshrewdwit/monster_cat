class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :authenticate_user!, :ensure_admin_user!

  def current_user
    User.find_by(id: session[:user_id])
  end

  def authenticate_user!
    unless logged_in?
       flash[:danger] = "Please log in."
       redirect_to root_path
    end
  end

  def ensure_admin_user!
    unless admin_user?
      flash[:danger] = "You do not have the required access"
      redirect_to root_path
    end
  end

  private

  def logged_in?
    current_user.present?
  end

  def admin_user?
    current_user.admin?
  end
end
