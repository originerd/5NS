class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:following, :followers]
  def index
    @users = User.select(:id, :email, :name).paginate(page: params[:page])
  end

  def show
    @user = User.select(:id, :email, :name).find(params[:id])
    @nanoposts = @user.nanoposts.paginate(page: params[:page])
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
end
