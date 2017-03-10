require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  # Although it's a test of controller, it inherits after
  # ActionDispatch::IntegrationTest, so it has to get Integration test helpers
  # from Devise, not Controller test helpers.
  # See https://github.com/plataformatec/devise/issues/4191
  include Devise::Test::IntegrationHelpers

  setup do
    @book = books(:one)
    sign_in create(:user)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post books_url, params: { book: { author: @book.author, isbn: @book.isbn, title: @book.title } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { author: @book.author, isbn: @book.isbn, title: @book.title } }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
