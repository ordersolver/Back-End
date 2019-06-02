# == Schema Information
#
# Table name: rols
#
#  id          :bigint           not null, primary key
#  descripcion :string
#  sinonimo    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class RolSerializer < ActiveModel::Serializer
  attributes :id, :descripcion, :sinonimo
end
