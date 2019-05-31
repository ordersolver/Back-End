class UserSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :apellidos, :tipo_documento, :direccion, :telefono
end
