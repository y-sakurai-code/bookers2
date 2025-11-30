class UsersController < ApplicationController

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
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :user_image, :introduction)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
