require 'rails_helper'

RSpec.describe "Events API" do
  before :each do
    @sport = create(:sport)
    @olympian1 = create(:olympian)
    @olympian2 = create(:olympian)
    @event1 = create(:event, sport: @sport)
    @event2 = create(:event, sport: @sport)
    @performance1 = create(:performance, event: @event1, olympian: @olympian1)
    @performance2 = create(:performance, event: @event1, olympian: @olympian2)
  end

  it "returns events for each sport" do
    headers = {
      content_type: "application/json",
      accept: "application/json"
    }

    get '/api/v1/events', headers: headers

    expect(response).to be_successful
    expect(status).to eq(200)

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:events]).to be_a Array

    events = data[:events]

    expect(events.first[:sport]).to eq(@sport.name)
    expect(events.first[:events]).to be_a Array
    expect(events.first[:events].length).to eq(2)
    expect(events.first[:events]).to include(@event1.name)
    expect(events.first[:events]).to include(@event2.name)
  end

  it "returns medalists for given event" do
    headers = {
      content_type: "application/json",
      accept: "application/json"
    }

    get "/api/v1/events/#{@event1.id}/medalists"

    expect(response).to be_successful
    expect(status).to eq(200)

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data).to have_key(:event)
    expect(data).to have_key(:medalists)

    event = data[:event]
    medalists = data[:medalists]

    expect(event).to eq(@event1.name)
    expect(medalists).to be_a Array
    expect(medalists.count).to eq(2)

    expect(medalists.first).to have_key(:name)
    expect(medalists.first).to have_key(:team)
    expect(medalists.first).to have_key(:age)
    expect(medalists.first).to have_key(:medal)
  end
end
