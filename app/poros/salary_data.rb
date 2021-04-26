class SalaryData
  attr_reader :salaries

  def initialize(data)
    @salaries = data
  end

  def self.get_salaries(destination)
    salaries = TeleportService.get_urban_salary_data(destination)["salaries"]
    SalaryData.new(salaries)
  end
end