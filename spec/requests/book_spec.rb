require "rails_helper"

RSpec.describe "Books", type: :request do
  describe "POST /books" do
    it "adds a book successfully" do
      expect {
        post books_path, params: {
          book: {
            title: "Test Title"
          }
        }
      }.to change(Book, :count).by(1)

      expect(response).to redirect_to(books_path)
      expect(flash[:notice]).to eq("Book was successfully added.")
    end
    
    it "does not add a book when the title is blank" do
      expect {
        post books_path, params: {
          book: {
            title: ""
          }
        }
      }.not_to change(Book, :count)
      expect(flash[:notice]).to eq("Book could not be added.")
    end

    it "adds a book with an author" do
      expect {
        post books_path, params: {
          book: {
            title: "Test book",
            author: "Test author"
          }
        }
      }.to change(Book, :count).by(1)

      book = Book.last

      expect(book.author).to eq("Test author")
    end
    
    it "adds a book with a price" do
      expect {
        post books_path, params: {
          book: {
            title: "Test book",
            price: 9.99
          }
        }
      }.to change(Book, :count).by(1)

      book = Book.last

      expect(book.price).to eq(9.99)
    end
    it "adds a book with a published date" do
      date = Date.new(2000, 1, 1)

      expect {
        post books_path, params: {
          book: {
            title: "Test book",
            published_date: date
          }
        }
      }.to change(Book, :count).by(1)

      book = Book.last

      expect(book.published_date).to eq(date)
    end
  end

  
end