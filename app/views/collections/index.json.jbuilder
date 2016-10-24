json.array!(@collections) do |collection|
  json.extract! collection, :id, :name, :type, :released, :description, :band_id
  json.url collection_url(collection, format: :json)
end
