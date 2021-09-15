class UsersController < ApplicationController
    def index
      @users = User.all
      # @user = User.new #追記すべきか
      @book = Book.new
      # @books = @user.books
    end

    def show
      # @users = User.all
      @user= User.find(params[:id])
      @book = Book.new
      @books = @user.books
    end

    def edit
      @users = User.new
      @user = User.find(params[:id])
      # @books = Book.new
    end

    def create
      @user = User.new(user_params)
      @user.user_id = current_user.id
      @user.save
      redirect_to book_path(current_user.id)
      # else
      # render :show
      # end
    end

    def update
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to user_path(@user)
      # else
      # render :edit
      # end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to  users_path
    end

    private

    def user_params
      params.require(:user).permit(:name,:profile_image,:introduction)
    end
end