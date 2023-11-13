require 'rails_helper'

RSpec.describe RecipeFacade do
  describe '#searched_recipes' do
    it 'returns an array of Recipe objects', :vcr do
        recipe_facade = RecipeFacade.new("Fiji")

        recipes = recipe_facade.searched_recipes

        expect(recipes).to be_an(Array)
        expect(recipes.first).to be_a(Recipe)
    end
  end
end
