class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])

    if user.valid?
      session[:user_id] = user.id
      flash[:notice] = "You are now signed in"
      if user.admin?
        redirect_to admin_workshops_path
      else
        redirect_to workshops_path
      end
    end
  end

  def destroy
    reset_session
    flash[:notice] = "You have signed out"
    redirect_to request.referer
  end
end
