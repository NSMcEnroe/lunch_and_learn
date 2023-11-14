class LearningResourcesFacade
  attr_reader :country
  def initialize(country)
    @country = country
  end

  def selected_video_resource
    video_data = VideoService.new.video_by_country(@country)
    pictures_data = PictureService.new.pictures_by_country(@country)

    LearningResource.new(video_data[:items][0], pictures_data[:photos], @country)
  end
end