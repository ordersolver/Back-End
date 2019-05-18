# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

#crear 50 usuarios
50.times do |row|
    user=User.new( nombre: Faker::Name.first_name, apellidos: Faker::Name.last_name,
    direccion: Faker::Address.street_address, telefono: Faker::Number.number(10),tipo_documento: "cc")
end
puts User.first

