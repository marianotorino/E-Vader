json.array!(@contacts) do |contact|
  json.extract! contact, :id, :kind, :data, :client_id
  json.url contact_url(contact, format: :json)
end
