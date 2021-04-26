class TeleportService
  def self.get_tel_data(search)
    response = conn.get("/api/cities/") do |f|
      f.params['search'] = search
      f.params['limit'] = 1
    end
    JSON.parse(response.body)['_embedded']['city:search-results'][0]['_links']['city:item']['href']
  end

  def self.get_city_data(search)
    response = Faraday.get(get_tel_data(search))
    JSON.parse(response.body)
  end

  def self.get_urban_data(search)
    response = Faraday.get(get_city_data(search)['_links'][ "city:urban_area"]["href"])
    JSON.parse(response.body)
  end

  def self.get_urban_salary_data(search)
    response = Faraday.get(get_urban_data(search)['_links'][ "ua:salaries"]["href"])
    JSON.parse(response.body)
  end

  def self.conn
    @conn ||= Faraday.new(url: 'https://api.teleport.org')
  end
end