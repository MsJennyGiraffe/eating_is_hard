class CreateSavedRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :saved_recipes do |t|
      t.string :url
      t.string :name
      t.string :f2f_id
    end
  end
end
