class LearningResource
  attr_reader :video, :country, :images
  def initialize(video_data, picture_data, country)
    @country = country
    @video = parse_video_info(video_data)
    @images = parse_photos(picture_data) 
  end

  def parse_photos(picture_data)
    if picture_data.nil?
      []
    else
      picture_data.map do |photo|
        { alt_tag: photo[:alt],
          url: photo[:url]
        }
      end
    end
  end

  def parse_video_info(video_data)
    if video_data.nil?
      {}
    else
      {
        title: video_data[:snippet][:title],
        youtube_video_id: video_data[:id][:videoId]
      }
    end
  end
end