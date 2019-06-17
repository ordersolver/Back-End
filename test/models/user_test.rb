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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
