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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
