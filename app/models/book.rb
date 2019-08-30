class Book < ApplicationRecord
  has_many :book_authors
  has_many :authors, through: :book_authors

  validates_presence_of :title
  validates :number_of_pages, numericality: {
          only_integer: true,
          greater_than_or_equal_to: 1}
  validates :publication_year, numericality: {
          only_integer: true,
          greater_than_or_equal_to: 1,
          less_than_or_equal_to: 2019}
end
