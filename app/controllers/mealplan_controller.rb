class MealplanController < ApplicationController
  before_action :authenticate_customer!
  
  def show 
    Mealplan.create_default(current_customer) unless current_customer.mealplan != nil
    @plan = Mealplan.find_by_id(current_customer)
  end

  def update
    # @errors = Mealplan.update_plan_errors(params)
    # if @errors != "" then 
    #   flash[:error] = @errors
    # else
      Mealplan.update_plan(params)
      flash[:success] = "Meal plan updated."
    # end
    redirect_to :root
  end
end
  