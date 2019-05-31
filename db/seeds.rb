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
    User.create( nombre: Faker::Name.first_name, apellidos: Faker::Name.last_name,
    direccion: Faker::Address.street_address, telefono: Faker::Number.number(10),tipo_documento: "cc")
end

#crear 30 productos
30.times do |row|
    product = Product.new(nombre: Faker::Commerce.product_name, 
              categoria: Faker::Commerce.department, valor: Faker::Commerce.price)
    product.save
end

#crear 50 ordenes
50.times do |row|
    order = Order.new(fecha: Faker::Date.backward(30), estado: "entregado", 
    direccion_entrega: Faker::Address.street_address, valor: Faker::Commerce.price, user_id: 1)
    order.products= Product.all.sample(2)
    order.save
end

#crear roles
Rol.create([{ descripcion:'administrador' }, { descripcion: 'cliente' }])
