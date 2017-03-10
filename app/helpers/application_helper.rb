module ApplicationHelper
  def book_cover_image(book)
    image_tag(
      "http://images.amazon.com/images/P/#{book.isbn.gsub(/[^0-9,.]/, '')}.01.ZTZZZZZZ.jpg",
      alt: "#{book.title} cover"
    )
  end

  def book_action_button(book)
    if book.rented?
      policy(book.rentals.last).finish? ? button_to('Return', rental_finish_path(book.rentals.last)) : "Rented until #{book.rentals.last.due_date}"
    else
      policy(book).rent? ? (button_to 'Rent', rental_create_path(book)) : 'Cannot rent'
    end
  end
end
