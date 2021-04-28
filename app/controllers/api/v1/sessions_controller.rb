class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user
      render json: UsersSerializer.new(user), status: 201
    else
      render json: {error: "Invalid Parameters"}, status: 400
    end
  end
end