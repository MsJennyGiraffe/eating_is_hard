require 'rails_helper'

describe Recipe do
  context "random" do
    it "makes recipes given a page number" do
      VCR.use_cassette("recipe model") do
        recipes = Recipe.random(2, 2)
        recipe_one = recipes.first
        recipe_two = recipes.last

        expect(recipe_one.title.class).to eq(String)
        expect(recipe_one.source_url.class).to eq(String)
        expect(recipe_one.f2f_url.class).to eq(String)
        expect(recipe_two.recipe_id.class).to eq(String)
        expect(recipe_two.image_url.class).to eq(String)
      end
    end
  end

  context "random_page" do
    it "generates a random number" do
      page = Recipe.random_page

      expect(page.between?(1,300)).to be(true)
    end
  end

  context "all" do
    it "returns all recipes" do
      recipe = Recipe.all( [{
        "title" => "Grilled Shrimp",
        "source_url" => "www.shrimp.com",
        "f2f_url" => "www.f2fshrimp.com",
        "recipe_id" => "1",
        "image_url" => "shrimp.jpg",
      }], "shrimp" )

      expect(recipe.first.title).to eq("Grilled Shrimp")
      expect(recipe.first.source_url).to eq("www.shrimp.com")
      expect(recipe.first.f2f_url).to eq("www.f2fshrimp.com")
      expect(recipe.first.recipe_id).to eq("1")
      expect(recipe.first.image_url).to eq("shrimp.jpg")
      expect(recipe.first.recommended).to eq("shrimp")
    end
  end
end
