class LearningResource
  def initialize(data, country)
    @title = data[:snippet][:title]
    @youtube_video_id = data[:id][:videoId]
  end
end