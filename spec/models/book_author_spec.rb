require 'rails_helper'

describe BookAuthor do
  describe "relationships" do
    it { should belong_to :book }
    it { should belong_to :author }
  end
end
