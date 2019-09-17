class Api::V1::EventsController < ApplicationController
  def index
    render json: EventsFacade.events(params)
  end
end
