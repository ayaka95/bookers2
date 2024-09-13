class UsersController < ApplicationController

  def show
    @books = Book.new
    @user = User.find(params[:id])
    @book = @user.books
  end

  def create
    @books = Book.new(book_params)
    @books.user_id = current_user.id
    if @books.save
      flash[:notice] = "successfully"
      redirect_to book_path(@books.id)
    else
      render :index
    end
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def index
    @user = current_user
    @books = Book.new
    @users = User.all
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:books).permit(:title, :body, :user_id)
  end
end
