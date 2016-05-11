# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#Default admin account
User.where(name: 'Admin', email: 'admin@sheffield.ac.uk', admin: 't', approved: 't').first_or_create(password:'12341234')

#Default categories
Category.create(name: 'Zero Failures')
Category.create(name: 'Resource Recovery and Efficiency')
Category.create(name: 'Buried Infrastructure Performance')

Subcategory.create(name: 'Economic')
Subcategory.create(name: 'Technology')
Subcategory.create(name: 'Knowledge')
