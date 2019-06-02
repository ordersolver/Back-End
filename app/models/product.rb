# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  cassata     :text
#  categoria   :text
#  densidad    :text
#  descripcion :text
#  grosor      :text
#  lamina      :text
#  medidas     :text
#  nombre      :text
#  tipo_tela   :text
#  valor       :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
    has_and_belongs_to_many :orders
    validates_associated :orders

    validates :nombre, presence: true, format: { with: /\A[a-zA-Z\s]+\z/,
    message: "only allows letters" }
    validates :categoria, format: { with: /\A[\D]+\z/,
    message: "only allows letters" }
    validates :valor, presence: true, numericality: { greater_than: 0 }
    
end
