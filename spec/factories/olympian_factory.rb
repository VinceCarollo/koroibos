FactoryBot.define do
  factory :olympian do
    sequence :name {|n| "TestOlympianName#{n}"}
    team { "TestOlympianTeam"}
    sequence :age {|n| 18 + n }
    sex { "F" }
    height { 23 }
    weight { 124 }
    sequence :total_medals_won {|n| n - 1 }
    sport
  end
end
