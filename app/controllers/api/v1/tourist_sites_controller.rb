class Api::V1::TouristSitesController < ApplicationController
  
  def index
    tourist_sites = TouristSiteFacade.new(params[:country]).close_tourist_sites
    render json: TouristSiteSerializer.new(tourist_sites)
  end
end