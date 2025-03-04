require 'faker'

puts "Suppression des anciens articles..."
Article.destroy_all

puts "Création de 10 nouveaux articles..."
10.times do
  Article.create!(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraph(sentence_count: 10)
  )
end

puts "10 articles ont été créés avec succès !"
