# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Inventory::Category.create(longname: "Correas", shortname: "CORR")
Inventory::Category.create(longname: "Cascos", shortname: "CAS")
role = Role.create(longname: "Gerente", shortname: "GEREN")

params_user = {firstname:    "admin", 
	          lastname:     "admin",
               email:        "jonathan.rojas@globalr.net",
               usertag:      "armando", 
               street_name:  "Barrio Obrero", 
               street_num:   "calle 14",
               career_num:   "carrera 12",
               home_num:     "12-12",
               address:      "Barrio Obrero, calle 14, carrera 12", 
               password:     "12345678",
               mobile_phone: "12345678909876",
               role_id:      role.id
              }

User.create!(params_user)