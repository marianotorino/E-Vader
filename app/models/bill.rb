class Bill < ActiveRecord::Base
  belongs_to :person
  belongs_to :client
  validates :person_id, :client_id, :date, :description, :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0, message: "solo se acepta números positivos o 0" }
end
