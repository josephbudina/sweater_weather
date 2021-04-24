class Api::V1::ForecastsController < ApplicationController
  def index
    weather = ForecastsFacade.forecast_object(params[:location])
    render json: ForecastsSerializer.new(weather)
  end
end