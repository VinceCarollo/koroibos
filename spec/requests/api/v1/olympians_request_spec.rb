require 'rails_helper'

RSpec.describe "Olympian API" do
  before :each do
    @olympian1 = create(:olympian)
    @olympian2 = create(:olympian)
  end

  it "gets all olympians" do
    headers = {
      content_type: "application/json",
      accept: "application/json"
    }

    get '/api/v1/olympians', headers: headers

    expect(response).to be_successful
    expect(status).to eq(200)

    olympians_data = JSON.parse(response.body, symbolize_names: true)[:olympians]

    expect(olympians_data).to be_a Array
    expect(olympians_data.count).to eq(2)

    expect(olympians_data.first[:name]).to eq(@olympian1.name)
    expect(olympians_data.first[:team]).to eq(@olympian1.team)
    expect(olympians_data.first[:age]).to eq(@olympian1.age)
    expect(olympians_data.first[:sport]).to eq(@olympian1.sport.name)
    expect(olympians_data.first[:sex]).to eq(@olympian1.sex)
    expect(olympians_data.first[:total_medals_won]).to eq(@olympian1.total_medals_won)
  end

  it "can give youngest olympian" do
    headers = {
      content_type: "application/json",
      accept: "application/json"
    }

    get '/api/v1/olympians?age=youngest', headers: headers

    expect(response).to be_successful
    expect(status).to eq(200)

    olympian_data = JSON.parse(response.body, symbolize_names: true)

    expect(olympian_data).to be_a Array
    expect(olympian_data.count).to eq(1)

    expect(olympian_data.first[:name]).to eq(@olympian1.name)
  end

  it "can give oldest olympian" do
    headers = {
      content_type: "application/json",
      accept: "application/json"
    }

    get '/api/v1/olympians?age=oldest', headers: headers

    expect(response).to be_successful
    expect(status).to eq(200)

    olympian_data = JSON.parse(response.body, symbolize_names: true)

    expect(olympian_data).to be_a Array
    expect(olympian_data.count).to eq(1)

    expect(olympian_data.first[:name]).to eq(@olympian2.name)
  end
end
