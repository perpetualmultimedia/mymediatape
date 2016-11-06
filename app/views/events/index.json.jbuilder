json.array!(@events) do |event|
  json.extract! event, :id, :band, :title, :date, :time, :description, :address, :city, :state, :ticket_link
  json.url event_url(event, format: :json)
end
