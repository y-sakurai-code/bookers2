class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @users = User.all
    @book_new = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book_all = @user.books.all
    @book_new = Book.new

  end

  def edit
    @user = User.find(params[:id])
    @user_image = UserImage.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :user_image, :introduction)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
