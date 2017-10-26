class CreateMealplans < ActiveRecord::Migration[5.1]
  def change
    create_table :mealplans do |t|
      t.belongs_to :customer, index: true
      t.integer :monday
      t.integer :tuesday
      t.integer :wednesday
      t.integer :thursday
      t.integer :friday
      t.integer :saturday
      t.integer :sunday
      t.string :state
      t.timestamps
    end
  end
end
