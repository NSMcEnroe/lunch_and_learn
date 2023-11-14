class LearningResource
  attr_reader :title, :youtube_video_id, :country, :images
  def initialize(video_data, picture_data, country)
    @title = data[:snippet][:title]
    @youtube_video_id = data[:id][:videoId]
    @country = country
    @images = parse_photos(picture_data)
  end

  def parse(picture_data)
    picture_data.map do |photo|
      { alt_tag: photo[:alt],
        url: => photo[:url]
      }
    end
  end
end