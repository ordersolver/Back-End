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
#  photo           :text
#  telefono        :text
#  tipo_documento  :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  no_id           :string
#

class User < ApplicationRecord
    has_one_attached :avatar
    has_secure_password
    has_many :orders
    has_and_belongs_to_many :rols
    validates_associated :orders
    validates_associated :rols

    validates :tipo_documento, presence: true, length: { is: 2 }
    validates :nombre, presence: true, format: { with: /\A[a-zA-ZÑñ\s]+\z/,
    message: "only allows letters" }
    validates :apellidos, format: { with: /\A[a-zA-ZÑñ\s]+\z/,
    message: "only allows letters" }
    validates :telefono, numericality: { only_integer: true }, length: { in: 7..10 }
    validates :no_id, uniqueness: true
    validates :email, uniqueness: true
    #validates :google_id, uniqueness: true
    scope :google_id, ->(google_id) { where google_id: google_id }
end
