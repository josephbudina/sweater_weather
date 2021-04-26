require 'securerandom'
class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      user.update(api_key: SecureRandom.hex)
      render json: UsersSerializer.new(user), status: 201
    else
      render json: user.errors.full_messages, status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :api_key)
  end
end