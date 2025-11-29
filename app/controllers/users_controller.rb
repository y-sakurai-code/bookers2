class UsersController < ApplicationController

  def index
    @users = User.all
    @user_login = current_user
  end

  def show
    @user_login = current_user
  end

  def edit
    @user = User.find(params[:id])
    @user_image = UserImage.new
    @user_image.user_id = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
    user = user.find(params[:id])
    user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :user_image, :introduction)
  end

end
