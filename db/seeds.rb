# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class Seed
  def initialize
    add_ingredients
  end

  def add_ingredients
    ingredients = ["Chicken", "Shrimp", "Salmon", "Beef", "Corn", "Onion"]
    ingredients.each do |ingredient|
      Ingredient.create(
      name: ingredient
      )
    end
    puts "Ingredients Created!"
  end
end

Seed.new
