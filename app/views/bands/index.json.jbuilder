json.array!(@bands) do |band|
  json.extract! band, :id, :group_name, :genre, :city, :state, :user_id, :description, :website
  json.url band_url(band, format: :json)
end
