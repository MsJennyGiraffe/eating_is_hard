class CreateDislikes < ActiveRecord::Migration[5.0]
  def change
    create_table :dislikes do |t|
      t.references :user, foreign_key: true
      t.references :ingredient, foreign_key: true
    end
  end
end
