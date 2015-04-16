class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @nanopost = Nanopost.find(params[:nanopost_id])
    @comment = @nanopost.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:success] = '댓글이 등록되었습니다.'
      redirect_to nanopost_path(@nanopost)
    else
      @comments = @nanopost.comments[0..-2]
      render 'nanoposts/show'
    end
  end

  def destroy
    @nanopost = Nanopost.find(params[:nanopost_id])
    @comment = @nanopost.comments.find(params[:id])

    if @comment.present?
      @comment.destroy
      flash[:success] = '댓글이 삭제되었습니다.'
      redirect_to @nanopost
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
