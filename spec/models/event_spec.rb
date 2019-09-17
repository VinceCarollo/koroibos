require 'rails_helper'

RSpec.describe Event, type: :model do

  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should belong_to :sport }
    it { should have_many :performances }
    it { should have_many :olympians }
  end

  describe 'instance methods' do
    before :each do
      @event = create(:event)
      @olympian = create(:olympian)
      create(:performance, olympian: @olympian, event: @event)
      create(:performance, olympian: @olympian, event: @event)
      create(:performance, olympian: @olympian, event: @event, medal: "NA")
    end

    it "#medalists" do
      medalists = @event.medalists

      expect(medalists.first.name).to eq(@olympian.name)
      expect(medalists.first.team).to eq(@olympian.team)
      expect(medalists.first.age).to eq(@olympian.age)
      expect(medalists.first.medal).to eq("Gold")
    end
  end
end
