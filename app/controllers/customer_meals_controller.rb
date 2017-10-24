class CustomerMealsController < ApplicationController
  before_action :authenticate_customer!
  respond_to :js

  def like
    @meal = Meal.find(params[:meal_id])
    if current_customer.like?(@meal)
      current_customer.unlike(@meal)
    else
      current_customer.like(@meal)
    end
  end
end