# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  apellidos       :text
#  direccion       :text
#  email           :string
#  nombre          :text
#  password_digest :string
#  telefono        :text
#  tipo_documento  :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  no_id           :string
#

class User < ApplicationRecord
    has_secure_password
    has_many :orders
    has_and_belongs_to_many :rols
    validates_associated :orders
    validates_associated :rols

    validates :tipo_documento, presence: true, length: { is: 2 }
    validates :nombre, presence: true, format: { with: /\A[a-zA-Z\s]+\z/,
    message: "only allows letters" }
    validates :apellidos, presence: true, format: { with: /\A[a-zA-Z\s]+\z/,
    message: "only allows letters" }
    validates :telefono, numericality: { only_integer: true }, length: { in: 7..10 }
    validates :no_id, uniqueness: true
    validates :email, uniqueness: true
end
