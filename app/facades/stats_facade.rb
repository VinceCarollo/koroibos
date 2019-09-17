class StatsFacade
  def initialize(params)
    @params = params
  end

  def self.olympian_stats(params)
    new(params).get_olympian_stats
  end

  def get_olympian_stats
    {
      olympic_stats: {
        total_competing_olympians: Olympian.count,
        average_weight: {
          unit: 'kg',
          male_olympians: Olympian.males.average_weight.to_f.round(1),
          female_olympians: Olympian.females.average_weight.to_f.round(1)
        },
        average_age: Olympian.average_age.to_f.round(1)
      }
    }
  end
end
