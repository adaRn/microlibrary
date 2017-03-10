class RentalsController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]

    # GET /rentals
    def index
      @rentals = Rental.all
    end

    # GET /rentals/create
    def create
      @rental = Rental.create(book: Book.find(params[:id]), user: current_user)

      respond_to do |format|
        if @rental.save
          format.html { redirect_to books_url, notice: 'Book was successfully rented.' }
        else
          format.html { redirect_to books_url, notice: 'Could not rent a book' }
        end
      end
    end

    # GET /rentals/create
    def finish
      @book = Book.new(book_params)

      respond_to do |format|
        if @book.save
          format.html { redirect_to @book, notice: 'Book was successfully created.' }
          format.json { render :show, status: :created, location: @book }
        else
          format.html { render :new }
          format.json { render json: @book.errors, status: :unprocessable_entity }
        end
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_rental
        @rental = Rental.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def rental_params
        params.require(:book).permit(:title, :author, :isbn)
      end

end
