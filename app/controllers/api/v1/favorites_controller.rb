class Api::V1::FavoritesController < ApplicationController
  def index
    user = User.find_by(api_key: params[:api_key])

    if user
      render json: FavoriteSerializer.new(user.favorites), status: 200
    else
      render json: { errors: "User is unauthorized" }, status: 401
    end
  end

  def create
    user = User.find_by(api_key: params[:api_key])

    if user
      user.favorites.create(favorite_params)
      render json: { success: "Favorite added successfully"}, status: 201
    else
      render json: { errors: "User is unauthorized" }, status: 401
    end
  end

  private

  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title)
  end
end
