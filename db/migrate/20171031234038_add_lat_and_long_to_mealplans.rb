class AddLatAndLongToMealplans < ActiveRecord::Migration[5.1]
  def change
    add_column :mealplans, :lat, :decimal
    add_column :mealplans, :long, :decimal
  end
end
