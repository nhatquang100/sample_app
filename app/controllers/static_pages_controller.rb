class StaticPagesController < ApplicationController
  def help; end

  def home
    return unless logged_in?
    @micropost  = current_user.microposts.build if logged_in?
    @feed_items = current_user.feed.paginate page: params[:page]
  end

  def about; end

  def contact; end
end
