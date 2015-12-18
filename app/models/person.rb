class Person < ActiveRecord::Base
  validates :name, :cuit, presence: true
  validates :cuit, uniqueness: { message: "ya existe en el sistema" }
  validates :cuit, format: { with: /\A\d{2}-{1}\d{8}-{1}\d{1}\z/, message: "debe tener el formato XX-XXXXXXXX-X" }
end
