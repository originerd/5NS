class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @nanopost = Nanopost.find(params[:nanopost_id])
    @nanopost.likes.create(user: current_user)
    flash[:success] = "글에 좋아요를 하였습니다."
    redirect_to session[:return_to] ||= request.referer
  end

  def destroy
    @nanopost = Nanopost.find(params[:nanopost_id])
    @like = @nanopost.likes.find_by(user: current_user)

    if @like.present?
      @like.destroy
      flash[:success] = "글에 좋아요를 취소 하였습니다."
    else
      flash[:danger] = "글에 좋아요를 하지 않으셨습니다."
    end

    redirect_to session[:return_to] ||= request.referer
  end
end
