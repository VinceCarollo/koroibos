class Api::V1::StatsController < ApplicationController
  def show
    render json: StatsFacade.olympian_stats(params)
  end
end
