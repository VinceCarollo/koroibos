class WelcomeController < ApplicationController
  def index
    render json: { message: "Welcome to the root of Koroibos!" }
  end
end
