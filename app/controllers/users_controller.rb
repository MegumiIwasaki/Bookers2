class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
  	@users = User.all
  	@book_new = Book.new
    @user = current_user
  end

  def show
    @books = @user.books
    @book_new = Book.new
  end

  def update
     if @user.update(user_params)
    redirect_to user_path(@user.id), notice: "You have updated user successfully."
     else
      render :edit
     end
  end

  def edit
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

private
  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
