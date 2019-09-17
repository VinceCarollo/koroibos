class EventsFacade
  def initialize(params)
    @params = params
  end

  def self.events(params)
    new(params).get_all_events
  end

  def get_all_events
    events = []
    Sport.with_events.each do |sport|
      events.push({
        sport: sport.name,
        events: sport.events.map{|event| event.name}
        })
    end
    {events: events}
  end
end
