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
end
