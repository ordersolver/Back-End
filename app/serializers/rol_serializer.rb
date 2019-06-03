# == Schema Information
#
# Table name: rols
#
#  id          :bigint           not null, primary key
#  descripcion :string
#  rol_name    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class RolSerializer < ActiveModel::Serializer
  attributes :id, :rol_name, :descripcion
end
