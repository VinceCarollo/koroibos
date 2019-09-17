class Api::V1::OlympiansController < ApplicationController
  def index
    if params[:age]
      render_by_age
    else
      render json: {olympians: Olympian.with_sport.map{|olympian| OlympianSerializer.new(olympian)}}
    end
  end

  private

  def render_by_age
    case params[:age].downcase
    when 'oldest'
      render json: [Olympian.oldest]
    when 'youngest'
      render json: [Olympian.youngest]
    else
      render json: { message: "Not Found" }, status: 404
    end
  end
end
