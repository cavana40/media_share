require 'rails_helper'

RSpec.describe Podcast, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:users) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
