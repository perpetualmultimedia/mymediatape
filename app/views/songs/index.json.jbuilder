json.array!(@songs) do |song|
  json.extract! song, :id, :title, :track_number, :description, :collection_id
  json.url song_url(song, format: :json)
end
