json.array!(@bills) do |bill|
  json.extract! bill, :id, :amount, :description, :date, :person_id, :client_id
  json.url bill_url(bill, format: :json)
end
