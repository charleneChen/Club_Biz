json.array!(@societies) do |society|
  json.extract! society, :id, :club_name, :username, :password, :admin_name, :admin_phone, :admin_email, :description
  json.url society_url(society, format: :json)
end
