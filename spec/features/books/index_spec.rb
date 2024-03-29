require 'rails_helper'

describe "Book Index Page" do
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

  it "displays pertinent info about each book" do
    visit "/books"

    within "#book-#{@old_man.id}" do
      expect(page).to have_content(@old_man.title)
      expect(page).to have_content(@old_man.number_of_pages)
      expect(page).to have_content(@old_man.publication_year)
      expect(page).to have_link(@ernest.name)
    end

    within "#book-#{@treasure_island.id}" do
      expect(page).to have_content(@treasure_island.title)
      expect(page).to have_content(@treasure_island.number_of_pages)
      expect(page).to have_content(@treasure_island.publication_year)
      expect(page).to have_link(@robert.name)
    end

    within "#book-#{@zombie.id}" do
      expect(page).to have_content(@zombie.title)
      expect(page).to have_content(@zombie.number_of_pages)
      expect(page).to have_content(@zombie.publication_year)
      expect(page).to have_link(@ernest.name)
      expect(page).to have_link(@robert.name)
    end
  end

  it "has links from the author names to the author show page" do
    visit "/books"

    within "#book-#{@zombie.id}" do
      click_link("#{@ernest.name}")
    end

    expect(current_path).to eq("/authors/#{@ernest.id}") 
  end
end
