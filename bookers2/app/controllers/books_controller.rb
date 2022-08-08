class BooksController < ApplicationController
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @book=Book.new
    @books=Book.all
    @book.user_id=current_user.id
  end
  
  def new
    @book=Book.new
    @books=Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
     redirect_to book_path(@book.id), notice: 'You have created book successfully.'
    else
      render :new
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to book_path
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
