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

    all_favorites_response = JSON.parse(response.body, symbolize_names: true)

    expect(all_favorites_response).to have_key :success
    expect(all_favorites_response[:success]).to eq("Favorite added successfully")

    egypt_recipe = User.last.favorites.first 

    expect(egypt_recipe.country).to eq("thailand")
    expect(egypt_recipe.recipe_link).to eq("https://www.tastingtable.com/entry_detail/chefs_recipes/12214/Fried_rice_with_a_welcome_addition.htm")
    expect(egypt_recipe.recipe_title).to eq("Crab Fried Rice (Khaao Pad Bpu)")
  end

  it "can reject the user if the API key is invalid", :vcr do
    user_info = {
      "name": "Odell",
      "email": "goodboy@ruffruff.com",
      "password": "treats4lyf",
      "password_confirmation": "treats4lyf"
    }

    post "/api/v1/users", params: user_info, as: :json 

    saved_recipe = {
      api_key: "that aint it chief",
      country:"thailand",
      recipe_link: "https://www.tastingtable.com/entry_detail/chefs_recipes/12214/Fried_rice_with_a_welcome_addition.htm",
      recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
    }

    post "/api/v1/favorites", params: saved_recipe, as: :json 

    expect(response.status).to eq(401)

    expect(response.body).to eq("{\"errors\":\"User is unauthorized\"}")
  end

  it "can show the user their favorites", :vcr do
    user_info = {
      "name": "Odell",
      "email": "goodboy@ruffruff.com",
      "password": "treats4lyf",
      "password_confirmation": "treats4lyf"
    }

    post "/api/v1/users", params: user_info, as: :json 

    saved_recipe = {
      api_key: User.last.api_key,
      country:"egypt",
      recipe_link: "https://www.thekitchn.com/recipe-egyptian-tomato-soup-weeknight-dinner-recipes-from-the-kitchn-123308",
      recipe_title: "Recipe: Egyptian Tomato Soup"
    }

    post "/api/v1/favorites", params: saved_recipe, as: :json 

    expect(response.status).to eq(201)

    saved_recipe_2 = {
      api_key: User.last.api_key,
      country:"thailand",
      recipe_link: "https://www.tastingtable.com/entry_detail/chefs_recipes/12214/Fried_rice_with_a_welcome_addition.htm",
      recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
    }

    post "/api/v1/favorites", params: saved_recipe_2, as: :json 

    expect(response.status).to eq(201)

    get "/api/v1/favorites?api_key=#{User.last.api_key}"

    expect(response.status).to eq(200)

    all_favorites_response = JSON.parse(response.body, symbolize_names: true)

    expect(all_favorites_response).to have_key :data
    expect(all_favorites_response[:data].count).to eq(2) 

    egypt_recipe = all_favorites_response[:data][0]

    expect(egypt_recipe).to have_key :id
    expect(egypt_recipe[:id]).to be_a(String)
    
    expect(egypt_recipe).to have_key :type
    expect(egypt_recipe[:type]).to eq("favorite")
    
    expect(egypt_recipe).to have_key :attributes
    expect(egypt_recipe[:attributes]).to be_a(Hash)

    expect(egypt_recipe[:attributes]).to have_key :recipe_title
    expect(egypt_recipe[:attributes][:recipe_title]).to eq("Recipe: Egyptian Tomato Soup")

    expect(egypt_recipe[:attributes]).to have_key :recipe_link
    expect(egypt_recipe[:attributes][:recipe_link]).to eq("https://www.thekitchn.com/recipe-egyptian-tomato-soup-weeknight-dinner-recipes-from-the-kitchn-123308")

    expect(egypt_recipe[:attributes]).to have_key :country
    expect(egypt_recipe[:attributes][:country]).to eq("egypt")

    expect(egypt_recipe[:attributes]).to have_key :created_at
    expect(egypt_recipe[:attributes][:created_at]).to be_a(String)
  end

  it "can return an empty array when no favorites have been saved", :vcr do
    user_info = {
      "name": "Odell",
      "email": "goodboy@ruffruff.com",
      "password": "treats4lyf",
      "password_confirmation": "treats4lyf"
    }

    post "/api/v1/users", params: user_info, as: :json 

    get "/api/v1/favorites?api_key=#{User.last.api_key}"

    expect(response.status).to eq(200)

    empty_response = JSON.parse(response.body, symbolize_names: true)

    expect(empty_response[:data]).to eq([])
  end

  it "returns an error if the api key does not match when accessing favorites", :vcr do
    user_info = {
      "name": "Odell",
      "email": "goodboy@ruffruff.com",
      "password": "treats4lyf",
      "password_confirmation": "treats4lyf"
    }

    post "/api/v1/users", params: user_info, as: :json 

    saved_recipe = {
      api_key: User.last.api_key,
      country:"egypt",
      recipe_link: "https://www.thekitchn.com/recipe-egyptian-tomato-soup-weeknight-dinner-recipes-from-the-kitchn-123308",
      recipe_title: "Recipe: Egyptian Tomato Soup"
    }

    post "/api/v1/favorites", params: saved_recipe, as: :json 

    expect(response.status).to eq(201)

    get "/api/v1/favorites?api_key=hello"

    expect(response.status).to eq(401)

    expect(response.body).to eq("{\"errors\":\"User is unauthorized\"}")
  end
end
