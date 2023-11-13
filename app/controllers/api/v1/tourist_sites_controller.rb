class Api::V1::TouristSitesController < ApplicationController
  
  def index
    tourist_sites = TouristSiteFacade.new(params[:country]).close_tourist_sites
    # recipes = RecipeFacade.new(params[:country]).searched_recipes
    # render json: RecipeSerializer.new(recipes)
  end
end