# == Schema Information
#
# Table name: rols
#
#  id          :integer          not null, primary key
#  descripcion :string
#  sinonimo    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Rol < ApplicationRecord
    has_and_belongs_to_many :users
    
    validates :sinonimo, presence: true, numericality: { greater_than: 0 }
    validates :descripcion, presence: true
end
