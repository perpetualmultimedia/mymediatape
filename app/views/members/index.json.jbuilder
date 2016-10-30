json.array!(@members) do |member|
  json.extract! member, :id, :first_name, :last_name, :email, :band_id
  json.url member_url(member, format: :json)
end
