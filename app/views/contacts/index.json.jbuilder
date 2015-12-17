json.array!(@contacts) do |contact|
  json.extract! contact, :id, :kind, :data, :client_id
  json.url client_contact_url(@client, contact, format: :json)
end
