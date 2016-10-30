json.array!(@albums) do |album|
  json.extract! album, :id, :name, :type, :released, :description, :band_id
  json.url album_url(album, format: :json)
end
