json.array!(@books) do |book|
  json.extract! book, :id, :title, :number_of_pages
  json.url book_url(book, format: :json)
end
