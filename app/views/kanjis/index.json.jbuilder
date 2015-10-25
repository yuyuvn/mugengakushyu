json.array!(@kanjis) do |kanji|
  json.extract! kanji, :id, :text, :mean, :other_mean, :kun, :on
  json.url kanji_url(kanji, format: :json)
end
