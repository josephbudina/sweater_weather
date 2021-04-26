class Salary
  attr_reader :id,
              :destination,
              :salaries,
              :forecast

  def initialize(data)
    @id = nil
    @destination = data[:destination]
    @forecast = data[:forecast]
    @salaries = data[:salaries]
  end
end