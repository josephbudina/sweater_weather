class SalariesFacade

  def self.get_forecast(destination)
    geo = GeocodeService.get_geocode_data(destination)[:results][0][:locations][0][:latLng]
    weather = OpenWeather.weather_objects(geo[:lat], geo[:lng])

    forecast = {
      summary: weather.weather_data[:current][:weather][0][:description],
      temperature: weather.weather_data[:current][:temp]
    }
  end

  def self.get_salaries(destination)
    salaries = Salary.get_salaries(destination)

    binding.pry
    titles = salaries.salaries.find_all do |title|
      jobs = ['Data Analyst', 'Data Scientist', 'Mobile Developer', 'QA Engineer', 'Software Engineer', 'Systems Administrator', 'Web Developer']
      title['job']
    end
  end
end