class RentalsController < ApplicationController

    # GET /rentals
    def index
      @rentals = Rental.all
    end

    # GET /rentals/create/:id
    # :id of the book
    def create
      @book = Book.find(params[:id])
      authorize @book, :rent?
      @rental = Rental.create(book: @book, user: current_user)

      if @rental.save
        redirect_to books_url, notice: 'Book was successfully rented.'
      else
        redirect_to books_url, notice: 'Could not rent a book'
      end
    end

    # GET /rentals/finish/:id
    # :id of the rental
    def finish
      @rental = Rental.find(params['id'])
      authorize @rental, :finish?
      @rental.finish_date = Date.today
      if @rental.save
        redirect_to books_url, notice: 'Book was successfully returned'
      else
        redirect_to books_url, notice: 'Book could not be returned'
      end
    end

end
