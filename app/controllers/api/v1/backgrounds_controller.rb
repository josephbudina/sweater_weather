class Api::V1::BackgroundsController < ApplicationController
  def index
    if params[:location]
      image = BackgroundsFacade.image_info(params[:location])
      render json: ImageSerializer.new(image)
    else
      render json: {error: "Invalid Parameters"}, status: 400
    end
  end
end