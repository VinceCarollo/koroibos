class MedalistsFacade
  def initialize(params)
    @params = params
  end

  def self.event_medalists(params)
    new(params).get_event_medalists
  end

  def get_event_medalists
    event = Event.find(@params[:event_id])

    create_medalists_hash(event)
  end

  private

  def create_medalists_hash(event)
    {
      event: event.name,
      medalists: serialize_medalists(event.medalists)
    }
  end

  def serialize_medalists(medalists)
    medalists.map do |medalist|
      {
        name: medalist.name,
        team: medalist.team,
        age: medalist.age,
        medal: medalist.medal
      }
    end
  end
end
