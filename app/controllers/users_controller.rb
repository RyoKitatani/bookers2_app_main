class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
  
  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    else
      render :edit
    end
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
  
  def index 
    @user = current_user
    @users =User.all
    @book = Book.new
  end
  
  def follower
    @user = User.find(params[:id])
    @book = Book.new
  end

  def followed
    @user = User.find(params[:id])
    @book = Book.new
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
