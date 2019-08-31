require 'rails_helper'

describe Author do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should have_many :book_authors }
    it { should have_many(:books).through(:book_authors) }
  end

  describe "instance methods" do
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

    it "average_book_length" do
      expect(@ernest.average_book_length).to eq(176)
      expect(@robert.average_book_length).to eq(280)
    end
  end
end
