json.array!(@win_conditions) do |win_condition|
  json.extract! win_condition, :id, :name, :game_id
  json.url win_condition_url(win_condition, format: :json)
end
