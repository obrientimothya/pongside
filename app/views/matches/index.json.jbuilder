json.array!(@matches) do |match|
  json.extract! match, :id, :a_first_name, :a_last_name, :a_country, :b_first_name, :b_last_name, :b_country, :is_running, :is_over, :table_id, :started_at, :finished_at, :a_red_card, :a_yellow_card, :a_timeout, :b_red_card, :b_yellow_card, :b_timeout
  json.url match_url(match, format: :json)
end
