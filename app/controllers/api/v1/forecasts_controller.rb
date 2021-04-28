class Api::V1::ForecastsController < ApplicationController
  def index
    if params[:location]
      weather = ForecastsFacade.forecast_object(params[:location])
      render json: ForecastsSerializer.new(weather)
    else
      render json: {error: "Invalid Parameters"}, status: 400
    end
  end
end