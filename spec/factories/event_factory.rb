FactoryBot.define do
  factory :event do
    sequence :name {|n| "Event#{n}Name"}
    sport
  end
end
