json.array!(@words) do |word|
  json.extract! word, :id, :text, :mean, :pronounce, :category_id
  json.url word_url(word, format: :json)
end
