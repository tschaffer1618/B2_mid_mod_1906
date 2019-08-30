require 'rails_helper'

describe Book do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_numericality_of(:number_of_pages)
            .is_greater_than_or_equal_to(1)
            .only_integer }
    it { should validate_numericality_of(:publication_year)
            .is_greater_than_or_equal_to(1)
            .is_less_than_or_equal_to(2019)
            .only_integer }
  end

  describe "relationships" do
    it { should have_many :book_authors }
    it { should have_many(:authors).through(:book_authors) }
  end
end
