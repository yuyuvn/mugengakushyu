json.array!(@answers) do |answer|
  json.extract! answer, :id, :test_id, :kanji_id
  json.url answer_url(answer, format: :json)
end
