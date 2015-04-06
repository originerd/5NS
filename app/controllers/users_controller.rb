class UsersController < ApplicationController
  def index
    @users = User.select(:id, :email, :name).paginate(page: params[:page])
  end

  def show
    @user = User.select(:id, :email, :name).find(params[:id])
  end
end
