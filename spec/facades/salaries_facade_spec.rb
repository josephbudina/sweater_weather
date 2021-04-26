require 'rails_helper'

RSpec.describe SalariesFacade, type: :model do

  describe "#get_forecast" do
    it "should get forecast" do
      result = SalariesFacade.get_forecast("denver")

      expect(result.class).to eq(Hash)
    end
  end
  
  describe "#get_salaries" do
    it "should get salaries" do
      result = SalariesFacade.get_salaries("denver")

      expect(result.class).to eq(Array)
      expect(result.size).to eq(7)
      expect(result[0].keys).to eq([:title, :min, :max])
    end
  end

  describe "#salary_setup" do
    it "should have correct hash" do 
      result = SalariesFacade.salary_set_up("denver")

      expect(result.class).to eq(Salary)
      expect(result.destination).to eq("denver")
      expect(result.id).to eq(nil)
      expect(result.forecast.keys).to eq([:summary, :temperature])
      expect(result.salaries.length).to eq(7)
    end
  end
end