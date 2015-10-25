json.array!(@goals) do |goal|
  json.extract! goal, :id, :goal, :deadline, :user_id
  json.url goal_url(goal, format: :json)
end
