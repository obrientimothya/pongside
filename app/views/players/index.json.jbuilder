json.array!(@players) do |player|
  json.extract! player, :id, :code, :last_name, :first_name, :country
  json.url player_url(player, format: :json)
end
