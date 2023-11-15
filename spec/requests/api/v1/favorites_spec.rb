require "rails_helper"

describe "Favorites Database" do
  it "can favorite a recipe", :vcr do
    user_info = {
      "name": "Odell",
      "email": "goodboy@ruffruff.com",
      "password": "treats4lyf",
      "password_confirmation": "treats4lyf"
    }

    post "/api/v1/users", params: user_info, as: :json 

    saved_recipe = {
      api_key: User.last.api_key,
      country:"thailand",
      recipe_link: "https://www.tastingtable.com/entry_detail/chefs_recipes/12214/Fried_rice_with_a_welcome_addition.htm",
      recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
    }

    post "/api/v1/favorites", params: saved_recipe, as: :json 

    expect(response.status).to eq(201)

    favorite_response = JSON.parse(response.body, symbolize_names: true)

    expect(favorite_response).to have_key :success
    expect(favorite_response[:success]).to eq("Favorite added successfully")

    thailand_recipe = User.last.favorites.first 

    expect(thailand_recipe.country).to eq("thailand")
    expect(thailand_recipe.recipe_link).to eq("https://www.tastingtable.com/entry_detail/chefs_recipes/12214/Fried_rice_with_a_welcome_addition.htm")
    expect(thailand_recipe.recipe_title).to eq("Crab Fried Rice (Khaao Pad Bpu)")

  end
end
