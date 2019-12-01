require 'rails_helper'

RSpec.describe Like, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:films) }

    it { should belong_to(:podcasts) }

    it { should belong_to(:articles) }

    it { should belong_to(:shows) }

    it { should belong_to(:books) }

    it { should belong_to(:users) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
