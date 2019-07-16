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

class OrderSerializer < ActiveModel::Serializer
  attributes :id, :fecha, :estado,
             :direccion_entrega, :valor,
             :client, :products
             
    def client 
       {client_id: self.object.user.id, client_name: self.object.user.nombre}
    end
    
    def products
        self.object.products.map do |product|
            {productId: product.id, productName: product.nombre, productValue: product.valor }
        end 
    end
end
