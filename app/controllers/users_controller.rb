class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :bio, :email, :password, :profile_img)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
end
