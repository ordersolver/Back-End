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
#  google_id       :text
#  no_id           :string
#

class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :nombre, :apellidos, :tipo_documento, :no_id, :email, :direccion, :telefono, :rols, :avatar

  def avatar
    return unless object.avatar.attached?

    object.avatar.blob.attributes
      .slice('filename', 'byte_size')
      .merge(url: avatar_url)
      .tap { |attrs| attrs['name'] = attrs.delete('filename')}
  end

  def avatar_url
    url_for(object.avatar)
  end
      
  def rols
    self.object.rols.map do |rol|
        {rolId: rol.id, rolName: rol.descripcion}
    end 
  end
end
