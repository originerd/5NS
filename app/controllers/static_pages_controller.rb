class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @nanopost = current_user.nanoposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def about
  end

  def help
  end

  def contact
  end
end
