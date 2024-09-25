# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

1000.times do |i|
    Place.create(
        name: Faker::Name.name,
        description: Faker::Lorem.paragraph,
        latitude: Faker::Address.latitude,
        longitude: Faker::Address.longitude,
        city: Faker::Address.city,
        country: Faker::Address.country
    )
    puts "created #{i+1} place."
end