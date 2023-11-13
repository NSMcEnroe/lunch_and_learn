class MapService
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.geoapify.com') do |faraday|
      faraday.params['apiKey'] = Rails.application.credentials.geoaplify[:key]
    end
  end

  def get_proximal_tourist_sights(longitude, latitude)
    get_url("/v2/places?categories=tourism.sights&filter=circle:#{longitude},#{latitude},1000&bias=proximity:#{longitude},#{latitude}")
  end
end