class Api::V1::LearningResourcesController < ApplicationController
  
  def index
    learning_resources = LearningResourcesFacade.new(params[:country]).selected_video_resoruce
    render json: LearningResourceSerializer.new(learning_resources)
  end
end