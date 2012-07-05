class BooksController < ApplicationController
  before_filter :signed_in?

  def index
    @books = Book.paginate(page: params[:page])
  end

  def destroy
    book=Book.find(params[:id])
    if book.borrowing_records.find_by_current(true).nil?
      book.destroy
      flash[:success] = "Book deleted!"
      redirect_to books_path
    else
      flash[:error] = "Book \"#{book.name}\" is not returned, please return it first!"
      redirect_to root_path
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params[:book])
    if @book.save
      flash[:success] = "Add Book \"#{@book.name}\"!"
      redirect_to books_path
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(params[:book])
      flash[:success] = "Info updated!"
      redirect_to @book
    else
      render 'edit'
    end
  end
end
