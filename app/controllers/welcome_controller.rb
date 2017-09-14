class WelcomeController < ApplicationController
  def index
    @customer_meal = CustomerMeal.new
    @meals = Meal.all
  end
end
