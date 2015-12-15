json.array!(@clients) do |client|
  json.extract! client, :id, :name, :surname, :dni, :gender, :birthdate, :cuit
  json.url client_url(client, format: :json)
end
