require 'csv'

namespace :import do
  task csv: :environment do
    OlympianMedal.destroy_all
    Olympian.destroy_all
    Event.destroy_all
    Sport.destroy_all

    olympic_data = CSV.read('./lib/assets/olympian_data.csv', headers: true, header_converters: :symbol)
    olympic_data.each do |row|

      sport = Sport.find_or_create_by(name: row[:sport])

      olympian = Olympian.create!({
          name: row[:name],
          team: row[:team],
          age: row[:age],
          sport: sport
        })

      event = Event.create!({
          name: row[:event],
          sport: sport
        })

      row[:medal] = "none" if row[:medal] = "NA"
      
      OlympianMedal.create!({
          medal_type: row[:medal],
          olympian: olympian,
          event: event
        })

    end
  end
end
