require 'rails_helper'

RSpec.describe OlympianMedal, type: :model do

  describe 'validations' do
    it { should validate_presence_of :medal_type }
  end

  describe 'relationships' do
    it { should belong_to :olympian }
    it { should belong_to :event }
  end

end
