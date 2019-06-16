# == Schema Information
#
# Table name: rols
#
#  id          :integer          not null, primary key
#  descripcion :string
#  rol_name    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Rol < ApplicationRecord
    has_and_belongs_to_many :users
    
    validates :rol_name, presence: true
    validates :descripcion, presence: true
end
