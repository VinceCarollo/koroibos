class Api::V1::OlympiansController < ApplicationController
  def index
    render json: OlympiansFacade.olympians(params)
  end
end
