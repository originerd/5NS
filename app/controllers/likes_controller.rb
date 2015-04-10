class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @nanopost = Nanopost.find(params[:nanopost_id])
    @nanopost.likes.create(user: current_user)

    respond_to do |format|
      format.html { redirect_to session[:return_to] ||= request.referer }
      format.js
    end
  end

  def destroy
    @nanopost = Nanopost.find(params[:nanopost_id])
    @like = @nanopost.likes.find_by(user: current_user)

    if @like.present?
      @like.destroy

      respond_to do |format|
        format.html do
          redirect_to session[:return_to] ||= request.referer
        end
        format.js
      end
    end
  end
end
