class MealplanController < ApplicationController
  before_action :authenticate_customer!
  
  def show 
    Mealplan.create_default(current_customer) unless current_customer.mealplan != nil
    #!!!!!! Why can't I pass this @plan variable to the show view, I had to it directly in views
    # @plan = current_customer.mealplan
    respond_to do |wants|
      wants.html { redirect_to root_path }
      wants.js
    end
  end

  def update
    Mealplan.update_plan(params)
    @plan = Mealplan.find_by_id(current_customer)
    respond_to do |wants|
      wants.html { redirect_to root_path }
      wants.js {  flash.now[:notice] = "Succesfully updated your settings." }
    end
  end
end



  