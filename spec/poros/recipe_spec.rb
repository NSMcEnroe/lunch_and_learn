require  "rails_helper"

RSpec.describe Recipe do
  it "exists" do
    attrs = {
      recipe: {
        label: "Mom's Spaghetti",
        image: "https://image.url/knees_weak_arms_heavy",
        url: "www.ew.com"
      }
    }

  recipe = Recipe.new(attrs, "thailand")

    expect(recipe).to be_a Recipe
    expect(recipe.url).to eq("www.ew.com")
    expect(recipe.title).to eq("Mom's Spaghetti")
    expect(recipe.country).to eq("thailand")
    expect(recipe.image).to eq("https://image.url/knees_weak_arms_heavy")
  end
end