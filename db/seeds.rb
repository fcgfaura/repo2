# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
5.times do
  news = New.create({title: Faker::Lorem.sentence, subtitle: Faker::Lorem.paragraph,
    body: Faker::Lorem.paragraph(15, false, 20)})
  3.times do
    news.comments.create({author: Faker::GameOfThrones.character, comment: Faker::Lorem.sentence})
  end
end
