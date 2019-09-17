require 'rails_helper'

RSpec.describe Olympian, type: :model do

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :team }
    it { should validate_presence_of :age }
    it { should validate_presence_of :sex }
    it { should validate_presence_of :total_medals_won }
  end

  describe 'relationships' do
    it { should have_many :performances }
    it { should have_many :events }
    it { should belong_to :sport }
  end

  describe 'class methods' do
    before :each do
      @olympian1 = create(:olympian)
      @olympian2 = create(:olympian)
    end

    it ".oldest" do
      expect(Olympian.oldest).to eq(@olympian2)
    end

    it ".youngest" do
      expect(Olympian.youngest).to eq(@olympian1)
    end
  end
end
