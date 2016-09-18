require 'rails_helper'

describe Food2forkService do
  context "get_recipe" do
    it "returns a list of recipes" do
      VCR.use_cassette("service recipes") do
        service = Food2forkService.new
        recipes = service.get_recipe(1)
        recipe = recipes["recipes"].first

        expect(recipes["count"]).to eq(1)
        expect(recipe["source_url"]).to eq("http://thepioneerwoman.com/cooking/2011/06/perfect-iced-coffee/")
        expect(recipe["f2f_url"]).to eq("http://food2fork.com/view/47024")
        expect(recipe["title"]).to eq("Perfect Iced Coffee")
        expect(recipe["recipe_id"]).to eq("47024")
        expect(recipe["image_url"]).to eq("http://static.food2fork.com/icedcoffee5766.jpg")
        expect(recipe["social_rank"]).to eq(100.0)
      end
    end
  end

  context "get_recipe" do
    it "returns a list of more recipes" do
      VCR.use_cassette("more service recipes") do
        service = Food2forkService.new
        recipes = service.get_recipe(3)
        recipe = recipes["recipes"].first
        last_recipe = recipes["recipes"].last

        expect(recipes["count"]).to eq(3)
        expect(recipe["source_url"]).to eq("http://thepioneerwoman.com/cooking/2011/06/perfect-iced-coffee/")
        expect(recipe["f2f_url"]).to eq("http://food2fork.com/view/47024")
        expect(recipe["title"]).to eq("Perfect Iced Coffee")
        expect(recipe["recipe_id"]).to eq("47024")
        expect(recipe["image_url"]).to eq("http://static.food2fork.com/icedcoffee5766.jpg")
        expect(recipe["social_rank"]).to eq(100.0)
        expect(last_recipe["source_url"]).to eq("http://thepioneerwoman.com/cooking/2008/06/crash-hot-potatoes/")
      end
    end
  end
end
