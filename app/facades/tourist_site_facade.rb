class TouristSiteFacade
  attr_reader :country
  def initialize(country)
    @country = country
  end

  def close_tourist_sites
    find_country = CountryService.new.get_country_coordinates(@country)
    capital_coordinates = find_country[0][:capitalInfo][:latlng]
    capital_latitude = capital_coordinates[0]
    capital_longitude = capital_coordinates[1]
  end
end
