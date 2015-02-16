# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Inventory::Category.create(longname: "Partes mecanicas", shortname: "pmeca")
Inventory::Category.create(longname: "Partes electricas", shortname: "pelct")
Inventory::Category.create(longname: "Accesorios", shortname: "acces")
Inventory::Category.create(longname: "Otros", shortname: "otros")

role = Role.create(longname: "Gerente", shortname: "GEREN")

params_user = {firstname:    "armando", 
	          lastname:     "Bautista",
               email:        "partstore.armando@gmail.com",
               usertag:      "armando", 
               street_name:  "Barrio Obrero",
               street_num:   "calle 14",
               career_num:   "carrera 12",
               home_num:     "14-10",
               address:      "Barrio Obrero, calle 14, carrera 12", 
               password:     "17811780",
               mobile_phone: "04247608879",
               role_id:      role.id
              }

User.create!(params_user)