class Food2forkService
  def initialize
    @conn = Faraday.new("http://food2fork.com/api/")
  end

  def get_recipe_by_page(page)
    response = @conn.get("search?key=#{ENV['FOOD2FORK_KEY']}&page=#{page}")
    parse(response.body)
  end

  def get_liked_food_recipe(ingredient)
    response = @conn.get("search?key=#{ENV['FOOD2FORK_KEY']}&q=shrimp")
    parse(response.body)["recipes"]
  end

  private
    def parse(response)
      JSON.parse(response)
    end
end
