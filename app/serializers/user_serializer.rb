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

class UserSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :apellidos, :tipo_documento, :no_id, :email, :direccion, :telefono
end
