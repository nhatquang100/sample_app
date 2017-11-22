class PasswordResetsController < ApplicationController
  before_action :gett_user, only: %i(edit update)
  before_action :valid_user, only: %i(edit update)
  before_action :check_expiration, only: %i(edit update)
  def new; end

  def create
    @user = User.find_by email: params[:password_reset][:email].downcase
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = t "controllers.password_resets_controller.flashinfo"
      redirect_to root_url
    else
      flash.now[:danger] = t "controllers.password_resets_controller.flashdanger"
      render :new
    end
  end

  def edit; end

  def update
    if params[:user][:password].empty?
      empty_password
    elsif @user.update_attributes user_params
      log_in @user
      @user.update_attribute :reset_digest, nil
      flash[:success] = t "controllers.password_resets_controller.mess2"
      redirect_to @user
    else
      render :edit
    end
  end

  def empty_password
    @user.errors.add :password, t("controllers.password_resets_controller.mess1")
    render :edit
  end

  private

  def user_params
    params.require(:user).permit :password, :password_confirmation
  end

  def gett_user
    @user = User.find_by email: params[:email]
    return if @user
    flash[:danger] = t "err"
    redirect_to root_url
  end

  def valid_user
    return if @user && @user.activated? && @user.authenticated?(:reset, params[:id])
    flash[:danger] = t "err"
    redirect_to root_url
  end

  def check_expiration
    return unless @user.password_reset_expired?
    flash[:danger] = t "controllers.password_resets_controller.mess3"
    redirect_to new_password_reset_url
  end
end
