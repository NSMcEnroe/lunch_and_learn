class Api::V1::LearningResourcesController < ApplicationController
  
  def index
    @country_learning_resources = LearningResourcesFacade.new(params[:country]).selected_video_resoruce
    render json: LearningResourceSerializer.new(@country_learning_resources)
  end
end