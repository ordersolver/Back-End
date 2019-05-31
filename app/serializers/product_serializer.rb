# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
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

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :categoria, :descripcion, :valor,
             :cassata, :densidad, :grosor, :lamina, :medidas,
             :tipo_tela
end
