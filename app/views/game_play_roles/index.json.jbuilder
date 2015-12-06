json.array!(@game_play_roles) do |game_play_role|
  json.extract! game_play_role, :id, :game_play_id, :game_role_id, :user_id
  json.url game_play_role_url(game_play_role, format: :json)
end
