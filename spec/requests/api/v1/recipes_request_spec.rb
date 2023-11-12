require "rails_helper"

RSpec.describe "Search for Recipes", type: :request do
  it "should return a list of recipes related to the keyword", :vcr do
    user_search = "thailand"

    get "/api/v1/recipes?country=#{user_search}"

    expect(response).to be_successful

    recipes_data = JSON.parse(response.body, symbolize_names: true)

    recipes = recipes_data[:data]

    recipes.each do |recipe|
      expect(recipe).to have_key(:id)
      expect(recipe[:id]).to eq(nil)

      expect(recipe).to have_key(:type)
      expect(recipe[:type]).to eq("recipe")

      expect(recipe).to have_key(:attributes)
      expect(recipe[:attributes][:title]).to be_a(String)
      expect(recipe[:attributes][:url]).to be_a(String)
      expect(recipe[:attributes][:country]).to be_a(String)
      expect(recipe[:attributes][:image]).to be_a(String)
    end
  end

  it "should return a list of recipes when user clicks on choose country for me", :vcr do
    user_search = "random"

    get "/api/v1/recipes?country=#{user_search}"

    expect(response).to be_successful

    recipes_data = JSON.parse(response.body, symbolize_names: true)

    recipes = recipes_data[:data]

    recipes.each do |recipe|
      expect(recipe).to have_key(:id)
      expect(recipe[:id]).to eq(nil)

      expect(recipe).to have_key(:type)
      expect(recipe[:type]).to eq("recipe")

      expect(recipe).to have_key(:attributes)
      expect(recipe[:attributes][:title]).to be_a(String)
      expect(recipe[:attributes][:url]).to be_a(String)
      expect(recipe[:attributes][:country]).to be_a(String)
      expect(recipe[:attributes][:image]).to be_a(String)
    end
  end
end