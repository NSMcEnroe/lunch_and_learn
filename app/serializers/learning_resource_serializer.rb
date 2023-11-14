class LearningResourceSerializer
  include JSONAPI::Serializer
  set_id { nil }
  set_type :learning_resource
  attributes :country, :video, :images

  def video
    {
      title: @country_learning_resources.title,
      youtube_video_id: @country_learning_resources.youtube_video_id
    }
  end

  def images
    @country_learning_resources.images
  end
end