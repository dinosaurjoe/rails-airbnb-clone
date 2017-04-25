class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  def show
    @user = User.find(params[:id])
  end
end
