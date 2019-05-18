class Rol < ApplicationRecord
    has_and_belongs_to_many :users
    
    validates :sinonimo, presence: true, numericality: { greater_than: 0 }
    validates :descripcion, presence: true
end
