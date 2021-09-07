class BooksController < ApplicationController
  def index
    @books = Book.all

    @book = Book.new
    @user = User.new

  end

  def show
    @book = Book.find(params[:id])
    # @users=User.all
    # @books = Book.all
    @user = User.new
    @users = User.page(params[:page]).reverse_order
   
    
  end

  def edit
    @books = Book.new
    @book = Book.find(params[:id])
    #if params[:id] == current_user.id
  #   @user = User.find(params[:id])
  #   render action: :edit
  # else
  #   @user = current_user
  #   render action: :show
  # end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to  books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body )
  end
end
