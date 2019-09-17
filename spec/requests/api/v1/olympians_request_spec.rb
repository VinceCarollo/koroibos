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

    olympians_data = JSON.parse(response.body, symbolize_names: true)

    expect(olympians_data).to have_key(:olympians)

    expect(olympians_data[:olympians]).to be_a Array
    expect(olympians_data[:olympians].count).to eq(2)

    expect(olympians_data[:olympians].first[:name]).to eq(@olympian1.name)
    expect(olympians_data[:olympians].first[:team]).to eq(@olympian1.team)
    expect(olympians_data[:olympians].first[:age]).to eq(@olympian1.age)
    expect(olympians_data[:olympians].first[:sport]).to eq(@olympian1.sport.name)
    expect(olympians_data[:olympians].first[:sex]).to eq(@olympian1.sex)
    expect(olympians_data[:olympians].first[:total_medals_won]).to eq(@olympian1.total_medals_won)
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

  it "can get olympian stats" do
    headers = {
      content_type: "application/json",
      accept: "application/json"
    }

    get '/api/v1/olympian_stats', headers: headers

    expect(response).to be_successful
    expect(status).to eq(200)

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data).to have_key(:olympic_stats)

    stats = data[:olympic_stats]

    expect(stats[:total_competing_olympians]).to eq(2)
    expect(stats).to have_key(:average_weight)
    average_weight = stats[:average_weight]
    expect(average_weight[:unit]).to eq('kg')
    expect(average_weight[:male_olympians]).to eq(0)

    expected = (@olympian1.weight.to_f + @olympian2.weight) / 2

    expect(average_weight[:female_olympians]).to eq(expected)

    expected = (@olympian1.age.to_f + @olympian2.age) / 2

    expect(stats[:average_age]).to eq(expected)
  end
end
