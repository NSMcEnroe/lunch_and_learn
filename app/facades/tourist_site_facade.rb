class TouristSiteFacade
  def initailize(country)
    @country = country
  end

  def close_tourist_sites
    coordinates = CountryService.new...