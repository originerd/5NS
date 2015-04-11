class NanopostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_nanopost, only: [:show, :destroy]

  def index
    @nanoposts = Nanopost.all
  end

  def show
    @user = @nanopost.user
  end

  def create
    @nanopost = current_user.nanoposts.build(nanopost_params)

    if @nanopost.save
      flash[:success] = '글이 등록되었습니다.'
      redirect_to root_path
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end

  def destroy
    authorize_action_for @nanopost
    @nanopost.destroy
    flash[:success] = '글이 삭제되었습니다.'
    redirect_to root_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_nanopost
    @nanopost = Nanopost.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def nanopost_params
    params.require(:nanopost).permit(:content, :picture)
  end
end
