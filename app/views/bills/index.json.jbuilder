json.array!(@bills) do |bill|
  json.extract! bill, :id, :amount, :description, :date, :person_id, :client_id
  json.url client_bill_url(@client,bill, format: :json)
end
