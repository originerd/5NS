class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:following, :followers]
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @nanoposts = @user.nanoposts.paginate(page: params[:page])
  end

  def following
    @user  = User.find(params[:id])
    @title = "#{@user.name}의 팔로잉"
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @title = "#{@user.name}의 팔로워"
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
end
