class Product < ApplicationRecord
    has_and_belongs_to_many :orders
    validates_associated :orders

    validates :nombre, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
    validates :categoria, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
    validates :valor, presence: true, numericality: { greater_than: 0 }
    
end
