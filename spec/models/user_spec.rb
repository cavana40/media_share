require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:films) }

    it { should have_many(:shows) }

    it { should have_many(:books) }

    it { should have_many(:podcasts) }

    it { should have_many(:articles) }

    it { should have_many(:follow_requests) }

    it { should have_many(:likes) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
