class Order < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :products

    validates :fecha, presence: true
    validates :estado, presence: true
    validates :direccion_entrega, presence: true
    validates :valor, presence: true, numericality: { greater_than: 0 }
end
