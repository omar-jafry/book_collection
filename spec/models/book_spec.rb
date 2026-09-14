require "rails_helper"

RSpec.describe Book, type: :model do
  describe "validations" do
    it "is valid with a title" do
      book = Book.new(title: "Testing title")
      expect(book).to be_valid
    end

    it "is invalid without a title" do
      book = Book.new(title: "")
      expect(book).not_to be_valid
    end
  end

  describe "author" do
    it "accepts a string author" do
      book = Book.new(title: "Test book", author: "Test author")

      expect(book.author).to eq("Test author")
    end
  end

  describe "price" do
    it "accepts a numerical price" do
      book = Book.new(title: "Test book", price: 9.99)

      expect(book.price).to eq(9.99)
    end
  end

  describe "published date" do
  it "accepts a date" do
    date = Date.new(2000, 1, 1)

    book = Book.new(title: "Test book", published_date: date)

    expect(book.published_date).to eq(date)
  end
end
end