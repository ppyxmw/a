class WelcomeController < ApplicationController
  def index
    @customer_meal = CustomerMeal.new
    @meals = Meal.all
    if current_customer
      Mealplan.create_default(current_customer) unless current_customer.mealplan != nil
    end
    @plan = Mealplan.find_by_id(current_customer)
  end
end
