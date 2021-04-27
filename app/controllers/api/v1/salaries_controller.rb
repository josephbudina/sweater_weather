class Api::V1::SalariesController < ApplicationController
  def index
    salaries = SalariesFacade.salary_set_up(params[:destination])
    render json: SalariesSerializer.new(salaries)
  end
end