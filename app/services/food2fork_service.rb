class Food2forkService
  def initialize
    @conn = Faraday.new("http://food2fork.com/api/")
  end

  def get_recipe(count)
    response = @conn.get("search?key=#{ENV['FOOD2FORK_KEY']}&count=#{count}")
    JSON.parse(response.body)
  end

  def get_recipe_by_page(page)
    response = @conn.get("search?key=#{ENV['FOOD2FORK_KEY']}&page=#{page}")
    JSON.parse(response.body)
  end
end
