class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        valid_user user
      else
        inactivated_user
      end
    else
      invalid_user
    end
  end

  def inactivated_user
    message  = t "controllers.sessions_controller.mes1"
    flash[:warning] = message
    redirect_to root_url
  end

  def valid_user user
    log_in user
    params[:session][:remember_me] == Settings.remember.ischeck ? remember(user) : forget(user)
    redirect_back_or user
  end

  def invalid_user
    flash.now[:danger] = t "controllers.sessions_controller.err"
    render :new
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
