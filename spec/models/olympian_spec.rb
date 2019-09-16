require 'rails_helper'

RSpec.describe Olympian, type: :model do

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :team }
    it { should validate_presence_of :age }
  end

  describe 'relationships' do
    it { should have_many :performances }
    it { should have_many :events }
    it { should belong_to :sport }
  end

end
