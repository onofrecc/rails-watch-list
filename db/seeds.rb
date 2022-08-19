# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# From the exercise copied and pasted

# puts "Deleting database..."
# List.destroy_all
# Bookmark.destroy_all
# Movie.destroy_all

# puts "Creating movies and one list at least..."

# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

# List.create(name: "Drama")
# List.create(name: "All time favourites")
# List.create(name: "Girl Power")

# puts "Done! Go ahead!"

require 'json'
require 'open-uri'

puts 'Deleting the database...'
List.destroy_all
Bookmark.destroy_all
Movie.destroy_all

puts 'Seeding the database...'

url = 'https://tmdb.lewagon.com/movie/top_rated'
response = URI.open(url).read
result = JSON.parse(response)
array = result['results']

array.each_with_index do |hash, _i|
  movie = Movie.new(
    title: hash['title'],
    poster_url: hash['poster_path'],
    overview: hash['overview'],
    rating: hash['vote_average']
  )
  movie.save!
end

List.create(name: "Drama")
List.create(name: "All time favourites")
List.create(name: "Girl Power")

puts 'Done! Go ahead!'
