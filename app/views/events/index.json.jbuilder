json.array!(@events) do |event|
  json.extract! event, :id, :title, :type, :content, :image_url, :ticket_price, :ticket_number
  json.url event_url(event, format: :json)
end
