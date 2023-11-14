class Api::V1::LearningResourcesController < ApplicationController
  
  def index
    learning_resources = LearningResourcesFacade.new(params[:country]).selected_learning_resoruces
    render json: LearningResourceSerializer.new(learning_resources)
    # recipes = RecipeFacade.new(params[:country]).searched_recipes
    # render json: RecipeSerializer.new(recipes)
  end
end