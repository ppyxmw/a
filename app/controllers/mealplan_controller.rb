class MealplanController < ApplicationController
  before_action :authenticate_customer!
  
  def show 
    debugger
    Mealplan.create_default(current_customer) unless current_customer.mealplan != nil
    # @plan = Mealplan.find_by_id(current_customer.id)
    # @plan = current_customer.mealplan
  end

  def update
    Mealplan.update_plan(params)
    flash[:success] = "Meal plan updated."
    redirect_to :root
  end
end
  