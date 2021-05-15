# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Not Seeded:
# Example Events - concert, dog training class, 3 ways to master attention and focus, presidential debate

# Creating seeded data for test purposes.
# Need to create:
#  Admin User
# Statuses - standard, premium, vip
# Categories - music, entertainment & art, science, politics, psychology & social change, health & personal growth


admin = User.create([
    {name: 'Admin', username: 'thisAdminAccount', password: 'thisAdminPassword', admin: true }
])

statuses = Status.create([
    {name: 'Standard'}, {name: 'Premium'}, {name: 'VIP'}
])

categories = Category.create([
    {name: 'Entertainment & Art', description: 'This includes music, movies, painting, dance, comedy, etc.'},
    {name: 'Science & Innovation', description: 'New scientific discoveries and engineering innovation and marvels.'},
    {name: 'Psychology, History and Social Change', description: 'What is, what was and what will be.  Discussing the nature of people and their envirement. Here we learn how we have been influenced and how we can be influenced. This section includes politics.'},
    {name: 'Health & Personal Growth', description: 'Exploring the path to mental and physical well-being.'},
    {name: 'Participatory', description: 'Requireing atendee participation. This is often educational.'}
])