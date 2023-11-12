class RecipeFacade
  attr_reader :country
  def initialize(country = nil)
    @country = country.downcase
  end

  def searched_recipes
    data = RecipeService.new.recipes_by_country(@country)

    data[:hits].map do |recipe_data|
      Recipe.new(recipe_data, @country)
    end
  end
end