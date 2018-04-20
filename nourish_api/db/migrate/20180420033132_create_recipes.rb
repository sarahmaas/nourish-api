class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.string :source
      t.integer :servings
      t.text :description

      t.timestamps
    end
  end
end
