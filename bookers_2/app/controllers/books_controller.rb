class BooksController < ApplicationController
  def index
    @books = Book.all
  # @book = Book.new 
    @user = User.new
    # @books = @user.book
  end

  def show
    @book = Book.find(params[:id])
    @user = User.new
    @users = User.page(params[:page]).reverse_order
    @user = @book.user
  end

  def edit
    @books = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    # @users = User.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
    # else
    # render :index
    # end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
    # else
    # render :edit
    # end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body )
  end
end
