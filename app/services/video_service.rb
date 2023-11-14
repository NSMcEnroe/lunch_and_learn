class VideoService
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.edamam.com/') do |faraday|
      faraday.params['app_id'] = "0c1af2a7"
      faraday.params['type'] = "public"
      faraday.params['app_key'] = Rails.application.credentials.edamam[:key]
    end
  end

  def recipes_by_country(country)
    get_url("api/recipes/v2?q=#{country}")
  end
end