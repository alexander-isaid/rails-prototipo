# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'faker'

puts "Eliminando posts existentes..."
Post.delete_all

puts "Generando 10,000 posts..."

posts = []

10_000.times do
  posts << {
    titulo: Faker::Book.title,
    descripcion: Faker::Lorem.paragraph(sentence_count: 10),
    fecha_publicacion: Faker::Time.between(from: 5.years.ago, to: Time.zone.now),
    numero_vistas: rand(0..100_000),
    publicado: [true, false].sample
  }
end

# Inserción en batch para mayor eficiencia
Post.insert_all(posts)

puts "¡Se crearon 10,000 posts correctamente! 🎉"