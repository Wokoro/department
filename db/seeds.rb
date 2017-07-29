# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
	9.times do|i|
		#puts "Hello Mr sammy #{i}"
		Student.create(matno:"UG/12/140#{i}", fname:"Fname#{i}", sname:"Sname#{i}", sex:"male", state_of_origin:"bayelsa", lga:"Ogbia", nationality:"Nigeria", religion:"Christianity", email:"user#{i}@gmail.com")
		Lecturer.create(staff_id:"Staff#{i}", fname:"Fname#{i}", sname:"Sname#{i}", sex:"female", state_of_origin:"bayelsa", lga:"Ogbia", nationality:"Ghana", religion:"Christianity", email:"user#{i}@gmail.com")
		Course.create(ccode:"EEE#{i}", ctitle:"course#{i}", units:3, level:"two", semester:"first_sem")
	end