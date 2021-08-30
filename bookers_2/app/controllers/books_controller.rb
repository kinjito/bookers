class BooksController < ApplicationController
  def index
    @books = Book.all
    
    @user = User.new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = User.new
    @users = User.all
  end

  def edit 
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(current_user.id)
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    # @book = Book.find(params[:id])
    # @book.destroy
    # redirect_to  books_path
  end
  

  private
  
  def book_params
    params.require(:book).permit(:title, :body ,:image)
  end
end
