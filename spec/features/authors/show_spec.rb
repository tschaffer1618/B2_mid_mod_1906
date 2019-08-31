require 'rails_helper'

describe "Author Show Page" do
  before(:each) do
    @ernest = Author.create!(name: "Ernest Hemingway")
    @robert = Author.create!(name: "Robert Louis Stevenson")
    @old_man = Book.create!(title: "The Old Man and the Sea",
                  number_of_pages: 143,
                  publication_year: 1952)
    @treasure_island = Book.create!(title: "Treasure Island",
                  number_of_pages: 351,
                  publication_year: 1883)
    @zombie = Book.create!(title: "A Zombie's Guide to Being Old and Finding Treasure",
                  number_of_pages: 209,
                  publication_year: 1925)
    @ernest.books << @old_man
    @ernest.books << @zombie
    @robert.books << @treasure_island
    @robert.books << @zombie
  end

  # As a user,
  # When I visit the Book Index Page,
  #   Then I see each author's name is a link
  # When I click the link
  #   Then I am taken to an Author Show Page where I see the author with that id including the author's:
  #   - name
  #   - the title of each book they have written
  #   - the average number of pages for all of their books
  it "displays pertinent info about the author" do
    visit "/authors/#{@ernest.id}"

    expect(page).to have_content(@ernest.name)
    expect(page).to have_content(@old_man.title)
    expect(page).to have_content(@zombie.title)
    expect(page).to have_content(@ernest.average_book_length)
  end
end
