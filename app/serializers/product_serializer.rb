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
#  photo       :text
#  tipo_tela   :text
#  valor       :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ProductSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :nombre, :categoria, :descripcion, :valor,
             :cassata, :densidad, :grosor, :lamina, :medidas,
             :tipo_tela, :photo

  def image
    return unless object.image.attached?

    object.image.blob.attributes
      .slice('filename', 'byte_size')
      .merge(url: image_url)
      .tap { |attrs| attrs['name'] = attrs.delete('filename')}
  end

  def image_url
    url_for(object.image)
  end
end
