class Api::V1::ForecastsController < ApplicationController
  def index
   lat_lng = ForecastsFacade.lat_lng(params[:location])
   render json: { data: lat_lng }
  end
end