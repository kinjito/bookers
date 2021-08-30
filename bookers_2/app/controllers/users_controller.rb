class UsersController < ApplicationController
  def index
    @users = User.all
    
    @book = Book.new
    @user = User.new
  end

  def show
    @users = User.all
    @user= User.find(params[:id])
  end

  def edit
    # @users = User.all
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to user_path
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    # @user = User.find(params[:id])
    # @user.destroy
    # redirect_to  users_path
    # ,notice: 'Book was successfully destroyed.'
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end
end