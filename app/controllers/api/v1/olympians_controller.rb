class Api::V1::OlympiansController < ApplicationController
  def index
    render json: {olympians: Olympian.with_sport.map{|olympian| OlympianSerializer.new(olympian)}}
  end
end
