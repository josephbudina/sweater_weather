class Salary
  attr_reader :id, 
              :salaries

  def initialize(data)
    @id = nil
    @salaries = data
  end

  def self.get_salaries(destination)
    salaries = TeleportService.get_urban_salary_data(destination)["salaries"]
    Salary.new(salaries)
  end
end