# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroy all"
# Bookmark.destroy_all
Booking.destroy_all
ObjetoAcuatico.destroy_all

usuario = User.new(first_name: 'hola', last_name: 'mundo', email: 'correousuario@example.com', password: '123456')

usuario.save!

obj = ObjetoAcuatico.new(title: 'Motito de agua', description: 'corre rapido buena calidad', location: 'la tortuga', price: 100, capacity: 2, user_id: usuario.id)

obj.save!


book = Booking.new(checkin: Date.new(2021,10,01), checkout: Date.new(2021,10,03), capacity: 2, objeto_acuatico_id: 3, user_id: 3)

book.save!


obj = ObjetoAcuatico.new(title: 'Motito de agua', description: 'corre rapido buena calidad', location: '16 Villa Gaudelet, Paris', price: 100, capacity: 2, user_id: 3)
obj.save!

ObjetoAcuatico.near('Tour Eiffel', 10)
