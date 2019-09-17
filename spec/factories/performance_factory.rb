FactoryBot.define do
  factory :performance do
    medal { "Gold" }
    games { "2016 Test Olympics" }
    olympian
    event
  end
end
