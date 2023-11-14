class LearningResourcesFacade
  def initialize(country)
    @country = country
  end

  def selected_video_resource
    data = LearningResourceService.new.video_by_country(@country)

    LearningResource.new(data[:items], @country)
    end
  end
end