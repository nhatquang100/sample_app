class UsersController < ApplicationController

  def show
    @user = User.find_by_id params[:id]
    if @user.blank?
      flash[:danger] = I18n.t "controllers.users_controller.err"
      redirect_to signup_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #or redirect_to  USER_URL ( @user )
      flash[:success] = I18n.t "controllers.users_controller.msg"
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation)
  end
end
