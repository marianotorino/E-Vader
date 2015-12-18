class Client < ActiveRecord::Base
  has_many :contacts, dependent: :destroy
  has_many :bills, dependent: :destroy
  validates :name, :surname, :cuit, :dni, :gender, :birthdate, presence: true
  validates :name, :surname, format: { with: /\A[a-zA-Z\s]+\z/,
    message: "sólo permite letras" }
  validates :cuit, format: { with: /\A\d{2}-{1}\d{8}-{1}\d{1}\z/, message: "debe tener el formato XX-XXXXXXXX-X" }
  validates :gender, inclusion: { in: %w(M F), message: "admite los valores M o F" }
  validates :dni, numericality: { only_integers: true }
  validates :dni, length: { minimum: 7, maximum: 9 }
  validates :dni, :cuit, uniqueness: { message: "ya existe en el sistema" }
end
