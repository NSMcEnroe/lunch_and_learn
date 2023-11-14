class PictureService
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.pexels.com') do |faraday|
      faraday.headers['Authorization'] = Rails.application.credentials.pexels[:key]
    end
  end

  def pictures_by_country(country)
    get_url("/v1/search?query=#{country}&per_page=10")
  end
end
