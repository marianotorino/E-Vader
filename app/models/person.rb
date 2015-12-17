class Person < ActiveRecord::Base
  validates :name, :cuit, presence: true
  validates :cuit, uniqueness: { message: "ya existe en el sistema" }
end
