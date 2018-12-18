# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# puts ">> Adding Game "
# game =  Game.find_or_initialize_by(name: "game1")
puts ">> Adding Question "
game = Game.first
  i = 1
  10.times do |email|
   question = Question.find_or_initialize_by(title: "question#{i}", game_id: game.id, answer:[true,false].sample)
   question.save!
   i+= 1
  end

puts "Done."

puts ">> Adding sub Question "
  questions = Question.where(parent_id: nil)
  questions.each do |q|
    question = Question.find_or_initialize_by(title: "sub1#{q.title}", parent_id: q.id, game_id: game.id, answer:[true,false].sample)
    question.save!
  end
