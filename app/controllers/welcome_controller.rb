class WelcomeController < ApplicationController
  def index
    @customer_meal = CustomerMeal.new
    @meals = Meal.all
    @address = Address.new
    @addresses =  Address.where(:addressable_id => current_customer.mealplan.id, :addressable_type => "Mealplan").all
    if current_customer
      Mealplan.create_default(current_customer) unless current_customer.mealplan != nil
    end
    @plan = Mealplan.find_by_id(current_customer)
  end
end
