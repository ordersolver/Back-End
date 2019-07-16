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

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
