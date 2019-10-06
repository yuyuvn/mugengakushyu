json.array!(@results) do |result|
  json.extract! result, :id, :test_id, :order, :answer_id, :correct
  json.url result_url(result, format: :json)
end
