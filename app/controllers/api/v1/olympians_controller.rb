class Api::V1::OlympiansController < ApplicationController
  def index
    render json: {olympians: Olympian.all.map{|olympian| OlympianSerializer.new(olympian)}}
  end
end
