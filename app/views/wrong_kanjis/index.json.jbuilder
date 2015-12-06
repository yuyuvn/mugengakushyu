json.array!(@wrong_kanjis) do |wrong_kanji|
  json.extract! wrong_kanji, :id, :times, :user_id, :kanji_id
  json.url wrong_kanji_url(wrong_kanji, format: :json)
end
