class User < ApplicationRecord
    has_many :orders
    has_and_belongs_to_many :rols
    validates_associated :orders
    validates_associated :rols

    validates :tipo_documento, presence: true, length: { is: 2 }
    validates :nombre, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
    validates :apellidos, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
    validates :telefono, numericality: { only_integer: true }, length: { in: 7..10 }
end
