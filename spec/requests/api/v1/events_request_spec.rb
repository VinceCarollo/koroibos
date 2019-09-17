require 'rails_helper'

RSpec.describe "Events API" do
  before :each do
    @sport = create(:sport)
    @event1 = create(:event, sport: @sport)
    @event2 = create(:event, sport: @sport)
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
end
