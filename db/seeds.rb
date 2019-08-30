# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


BookAuthor.destroy_all
Book.destroy_all
Author.destroy_all

#authors
ernest = Author.create!(name: "Ernest Hemingway")
robert = Author.create!(name: "Robert Louis Stevenson")

#books
old_man = Book.create!(title: "The Old Man and the Sea",
              number_of_pages: 143,
              publication_year: 1952)
treasure_island = Book.create!(title: "Treasure Island",
              number_of_pages: 351,
              publication_year: 1883)
zombie = Book.create!(title: "A Zombie's Guide to Being Old and Finding Treasure",
              number_of_pages: 209,
              publication_year: 1925)

#book_authors
ernest.books << old_man
ernest.books << zombie
robert.books << treasure_island
robert.books << zombie
