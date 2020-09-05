class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @book_new = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book_new = Book.new
  end

  def edit
    if @book.user_id != current_user.id
      redirect_to books_path()
    end
  end

  def update
      if @book.update(book_params)
           redirect_to book_path(@book.id), notice: "You have updated book successfully."
      else
           render :edit
    end
  end

  def create
  	@book_new = Book.new(book_params)
  	@book_new.user_id = current_user.id
  	if @book_new.save
  	       redirect_to book_path(@book_new.id), notice: "You have creatad book successfully."
    else
           redirect_to books_path(), flash: { error: @book_new.errors.full_messages }
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
