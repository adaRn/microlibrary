module ApplicationHelper
  def book_cover_image(book)
    image_tag(
      "http://images.amazon.com/images/P/#{book.isbn.gsub(/[^0-9,.]/, '')}.01.ZTZZZZZZ.jpg",
      alt: "#{book.title} cover"
    )
  end
end
