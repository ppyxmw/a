class MealplanController < ApplicationController
  before_action :authenticate_customer!
  
  def show 
    Mealplan.create_default(current_customer) unless current_customer.mealplan != nil
    #!!!!!! Why can't I pass this @plan variable to the show view, I had to it directly in views
    # @plan = current_customer.mealplan
  end

  def update
    Mealplan.update_plan(params)
    flash[:success] = "Meal plan updated."
    redirect_to :root
  end
end
  