class RecipeFacade
  attr_reader :country
  def initialize(country)
    @country = country.downcase
  end

  def searched_recipes
    if @country == "random"
      random_country = CountryService.new.random_country.sample[:name][:common].downcase

      data = RecipeService.new.recipes_by_country(country)

      data[:hits].map do |recipe_data|
        Recipe.new(recipe_data, country)
      end
    else
      data = RecipeService.new.recipes_by_country(@country)

      data[:hits].map do |recipe_data|
        Recipe.new(recipe_data, @country)
      end
    end
  end
end