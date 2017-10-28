class AddDailyAddressToMealplans < ActiveRecord::Migration[5.1]
  def change
    add_column :mealplans, :monday_address, :integer
    add_column :mealplans, :tuesday_address, :integer
    add_column :mealplans, :wednesday_address, :integer
    add_column :mealplans, :thursday_address, :integer
    add_column :mealplans, :friday_address, :integer
    add_column :mealplans, :saturday_address, :integer
    add_column :mealplans, :sunday_address, :integer
  end
end
