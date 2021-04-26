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

      expect(result.class).to eq(Hash)
    end
  end
end