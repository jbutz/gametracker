json.array!(@game_plays) do |game_play|
  json.extract! game_play, :id, :game_id, :day, :name
  json.url game_play_url(game_play, format: :json)
end
