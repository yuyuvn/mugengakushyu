json.array!(@characters) do |character|
  json.extract! character, :id, :text, :order, :kanji_id
  json.url character_url(character, format: :json)
end
