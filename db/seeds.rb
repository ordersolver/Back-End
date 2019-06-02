# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


#crear roles
if  !Rol.exists?
    rols=[{ descripcion:'administrador', sinonimo: 1  }, { descripcion: 'cliente',sinonimo: 2 }]
    puts rols
    for rol in rols
      Rol.create(rol)
    end
end

#crear usuario con password 12345678 y correo email@email.com
user=User.new( nombre: Faker::Name.first_name, apellidos: Faker::Name.last_name,
direccion: Faker::Address.street_address, telefono: Faker::Number.number(digits=10),tipo_documento: "cc",
password: "12345678", password_confirmation: "12345678", no_id: Faker::Number.number(digits=10), email: "email@email.com")
rol=[]
rol.append(Rol.first)
user.rols = rol
user.save
puts user.password
puts user.email

#crear 50 usuarios
50.times do |row|
    pass=Faker::Internet.password
    user=User.new( nombre: Faker::Name.first_name, apellidos: Faker::Name.last_name,
    direccion: Faker::Address.street_address, telefono: Faker::Number.number(digits=10),tipo_documento: "cc",
    password: pass, password_confirmation: pass, no_id: Faker::Number.number(digits=10), email: Faker::Internet.email)
    user.rols=Rol.all.sample(1)
    user.save
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

