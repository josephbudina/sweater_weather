class Api::V1::BackgroundsController < ApplicationController
  def index
    image = BackgroundsFacade.image_info(params[:location])
    render json: ForecastsSerializer.new(image)
  end
end