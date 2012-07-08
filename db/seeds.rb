# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: 'Admin', email: 'admin@admin.com', password: 'Admin', password_confirmation: 'Admin', rango: 'Administrador' )
Board.create(title: 'Panel Principal', descripcion: "panel padre",padre: 0)