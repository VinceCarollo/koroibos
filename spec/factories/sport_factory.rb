FactoryBot.define do
  factory :sport do
    sequence :name {|n| "TestSportName#{n}" }
  end
end
