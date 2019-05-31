# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  apellidos      :text
#  direccion      :text
#  nombre         :text
#  telefono       :text
#  tipo_documento :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class UserSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :apellidos, :tipo_documento, :direccion, :telefono
end
