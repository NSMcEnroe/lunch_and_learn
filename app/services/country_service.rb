class CountryService
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://restcountries.com')
  end

  def random_country
    get_url("/v3.1/all")
  end

  def get_country_coordinates(country)
    without_spaces_country = country.gsub(" ", "%20")
    get_url("v3.1/name/#{without_spaces_country}")
  end
end