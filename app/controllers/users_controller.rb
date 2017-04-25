class UsersController < ApplicationController
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
