# == Schema Information
#
# Table name: orders
#
#  id                :bigint           not null, primary key
#  direccion_entrega :text
#  estado            :string
#  fecha             :datetime
#  valor             :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#

class Order < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :products

    validates :fecha, presence: true
    validates :estado, presence: true
    validates :direccion_entrega, presence: true
    validates :valor, presence: true, numericality: { greater_than: 0 }

    scope :estado, ->(estado) { where estado: estado }
    scope :id, ->(id) { where id: id }

end
