class Api::V1::MedalistsController < ApplicationController
  def index
    render json: MedalistsFacade.event_medalists(params)
  end
end
