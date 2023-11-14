class LearningResourceSerializer
  include JSONAPI::Serializer
  set_id { nil }
  set_type :learning_resource
  attributes :title, :youtube_video_id
end