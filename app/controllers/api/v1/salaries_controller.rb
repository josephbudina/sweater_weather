class Api::V1::SalariesController < ApplicationController
  def index
    if params[:destination]
      salaries = SalariesFacade.salary_set_up(params[:destination])
      render json: SalariesSerializer.new(salaries)
    else
      render json: {error: "Invalid Parameters"}, status: 400
    end
  end
end