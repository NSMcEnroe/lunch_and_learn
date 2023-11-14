class VideoService
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://youtube.googleapis.com') do |faraday|
      faraday.params['key'] = Rails.application.credentials.youtube[:key]
      faraday.params['part'] = 'snippet'
      faraday.params['channelId'] = 'UCluQ5yInbeAkkeCndNnUhpw'
      faraday.params['maxResults'] = 1
      faraday.params['type'] = 'video'
    end
  end

  def video_by_country(country)
    get_url("/youtube/v3/search?q=#{country}")
  end
end