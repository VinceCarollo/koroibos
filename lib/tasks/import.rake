require 'csv'

namespace :import do
  task csv: :environment do
    Performance.destroy_all
    Olympian.destroy_all
    Event.destroy_all
    Sport.destroy_all

    olympic_data = CSV.read('./lib/assets/olympian_data.csv', headers: true, header_converters: :symbol)
    olympic_data.each do |row|

      sport = Sport.find_or_create_by(name: row[:sport])

      olympian = Olympian.find_or_create_by({
          name: row[:name],
          team: row[:team],
          age: row[:age],
          sex: row[:sex],
          sport: sport
        })

      if row[:medal] != 'NA'
        olympian.total_medals_won += 1
        olympian.save
      end

      event = Event.find_or_create_by({
          name: row[:event],
          sport: sport
        })

      Performance.create!({
          medal: row[:medal],
          olympian: olympian,
          games: row[:games],
          event: event
        })
    end
  end
end
