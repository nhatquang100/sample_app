class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find_by id: params[:followed_id]
    if @user
      current_user.follow @user
      response_action @user
    else
      flash[:danger] = t "controllers.relationships_controller.danger"
      redirect_to root_url
    end
  end

  def destroy
    user = Relationship.find_by id: params[:id]
    if user
      @user = user.followed
      current_user.unfollow @user
      response_action @user
    else
      flash[:danger] = t "controllers.relationships_controller.danger"
      redirect_to root_url
    end
  end

  def response_action user
    respond_to do |format|
      format.html{redirect_to user}
      format.js
    end
  end
end
