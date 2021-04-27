class Api::V1::RoadTripsController < ApplicationController
  before_action :validate_params

  def create
    road_trip = RoadTripsFacade.get_route(params[:origin], params[:destination])
    render json: RoadTripSerializer.new(road_trip)
  end

  private

  def validate_params
    if request.body.read.blank?
      render json: { error: "Must provide request body" }, status: :bad_request
    else
      params = JSON.parse(request.body.read, symbolize_names: :true)
      if params[:origin].blank? || params[:destination].blank?
        render json: { error: "Must provide origin and destination" }, status: :bad_request
      elsif !User.find_by(api_key: params[:api_key])
        render json: { error: "Must provide valid API key" }, status: :unauthorized
      end
    end
  end
end