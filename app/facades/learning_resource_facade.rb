class LearningResourcesFacade
  def initialize(country)
    @country = country
  end

  def selected_video_resource
    video_data = VideoService.new.video_by_country(@country)
    pictures_data = PicturesService.new...

    LearningResource.new(video_data[:items], @country)
    end
  end
end