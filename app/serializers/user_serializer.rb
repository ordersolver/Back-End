# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
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
  attributes :id, :nombre, :apellidos, :tipo_documento, :no_id, :email, :direccion, :telefono, :rols
      
      def rols
        self.object.rols.map do |rol|
            {rolId: rol.id, rolName: rol.descripcion}
        end 
      end
end
