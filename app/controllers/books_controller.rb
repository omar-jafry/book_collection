class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :delete, :destroy]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path, notice: "Book was successfully added."
    else
      render :new, status: :unprocessable_content
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Book was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: "Book was successfully destroyed.", status: :see_other
  end

  def delete
  end

  private
    def set_book
      @book = Book.find(params.expect(:id))
    end
    
    def book_params
      params.expect(book: [:title])
    end
end
