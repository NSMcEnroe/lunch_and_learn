require 'rails_helper'

describe RecipeService do
  context "class methods" do
    context "#recipes_by_country" do
      it "returns recipes related to the country", :vcr do
        search = RecipeService.new.recipes_by_country("china")

        expect(search).to be_a Hash
        expect(search[:hits]).to be_an Array

        recipe_data = search[:hits].first

        expect(recipe_data[:recipe]).to have_key :label
        expect(recipe_data[:recipe][:label]).to be_a(String)

        expect(recipe_data[:recipe]).to have_key :url
        expect(recipe_data[:recipe][:url]).to be_a(String)

        expect(recipe_data[:recipe]).to have_key :image
        expect(recipe_data[:recipe][:image]).to be_a(String)
      end
    end
  end
end