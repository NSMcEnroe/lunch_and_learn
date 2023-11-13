class TouristSiteFacade
  attr_reader :country
  def initialize(country)
    @country = country
  end

  def close_tourist_sites
    find_country = CountryService.new.get_country_coordinates(@country)

    if find_country.is_a?(Array)
      capital_coordinates = find_country[0][:capitalInfo][:latlng]
      capital_latitude = capital_coordinates[0]
      capital_longitude = capital_coordinates[1]

      data = MapService.new.get_proximal_tourist_sights(capital_longitude, capital_latitude)

      data[:features].map do |tourist_site_data|
        TouristSite.new(tourist_site_data)
      end
    else
      return []
    end
  end
end
