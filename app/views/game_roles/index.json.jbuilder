json.array!(@game_roles) do |game_role|
  json.extract! game_role, :id, :name, :game_id
  json.url game_role_url(game_role, format: :json)
end
