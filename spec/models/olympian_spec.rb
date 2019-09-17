require 'rails_helper'

RSpec.describe Olympian, type: :model do

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :team }
    it { should validate_presence_of :age }
    it { should validate_presence_of :sex }
    it { should validate_presence_of :height }
    it { should validate_presence_of :weight }
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

    it "#oldest" do
      expect(Olympian.oldest).to eq(@olympian2)
    end

    it "#youngest" do
      expect(Olympian.youngest).to eq(@olympian1)
    end

    it "#females" do
      expect(Olympian.females.count).to eq(2)
    end

    it "#males" do
      expect(Olympian.males.count).to eq(0)
    end

    it "#average_age" do
      expected = (@olympian1.age.to_f + @olympian2.age) / 2

      expect(Olympian.average_age).to eq(expected)
    end

    it "#average_weight" do
      expected = (@olympian1.weight.to_f + @olympian2.weight) / 2
      
      expect(Olympian.average_weight).to eq(expected)
      expect(Olympian.females.average_weight).to eq(expected)
    end
  end
end
