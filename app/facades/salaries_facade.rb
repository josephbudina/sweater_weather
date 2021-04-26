class SalariesFacade

  def self.get_forecast(destination)
    geo = GeocodeService.get_geocode_data(destination)[:results][0][:locations][0][:latLng]
    weather = OpenWeather.weather_objects(geo[:lat], geo[:lng])

    forecast = {
      summary: weather.weather_data[:current][:weather][0][:description],
      temperature: "#{weather.weather_data[:current][:temp]} F"
    }
  end

  def self.get_salaries(destination)
    salary = SalaryData.get_salaries(destination)

    titles = salary.salaries.find_all do |title|
      jobs = ['Data Analyst', 'Data Scientist', 'Mobile Developer', 'QA Engineer', 'Software Engineer', 'Systems Administrator', 'Web Developer']
      jobs.include?(title['job']['title'])
    end
    titles.map do |title|
      salaries = {
        title: title['job']['id'],
        min: sprintf("$%2.2f", title['salary_percentiles']['percentile_25'].round(2)),
        max: sprintf("$%2.2f", title['salary_percentiles']['percentile_75'].round(2))
      }
    end
  end

  def self.salary_set_up(destination)
    attributes = {
      destination: destination,
      forecast: get_forecast(destination),
      salaries: get_salaries(destination)
    }
    Salary.new(attributes)
  end
end