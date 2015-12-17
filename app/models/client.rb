class Client < ActiveRecord::Base
  has_many :contacts, dependent: :destroy
  has_many :bills, dependent: :destroy
  validates :name, :surname, :cuit, :dni, :gender, :birthdate, presence: true
  validates :name, :surname, format: { with: /[a-zA-Z\s]/,
    message: "sólo permite letras" }
  validates :gender, inclusion: { in: %w(M F), message: "admite los valores M o F" }
  validates :dni, numericality: { only_integers: true }
  validates :dni, length: { minimum: 7, maximum: 9 }
  validates :dni, :cuit, uniqueness: { message: "ya existe en el sistema" }
end
