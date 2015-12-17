class Client < ActiveRecord::Base
  has_many :contacts
  has_many :bills
  validates :name, :surname, :cuit, :dni, :gender, :birthdate, presence: true
  validates :name, :surname, format: { with: /[a-zA-Z\s]/,
    message: "sólo permite letras" }
  validates :gender, inclusion: { in: %w(M F), message: "admite los valores M o F" }
  validates :dni, numericality: { only_integers: true }
  validates :dni, length: { minimum: 7 }
end
