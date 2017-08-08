class CreateMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.text :description
      t.string :name
      t.string :image
      t.belongs_to :chef
      t.integer :rating
      t.timestamps
    end
  end
end
