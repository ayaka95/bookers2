class BooksController < ApplicationController

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.new
    @books = Book.find(params[:id])
    @user = @books.user
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def edit
    @books = Book.find(params[:id])

    unless @books.user_id == current_user.id
      redirect_to books_path
    end
  end

  def update
    @books = Book.find(params[:id])
    if @books.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path(@books)
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
