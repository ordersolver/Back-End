# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  apellidos      :text
#  direccion      :text
#  nombre         :text
#  telefono       :text
#  tipo_documento :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
