class Api::V1::RecipesController < ApplicationController
  
  def index
    recipes = RecipeFacade.new(params[:country]).searched_recipes
    render json: RecipeSerializer.new(recipes)
  end
end