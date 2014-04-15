json.array!(@tables) do |table|
  json.extract! table, :id, :name, :reverse_ends
  json.url table_url(table, format: :json)
end
