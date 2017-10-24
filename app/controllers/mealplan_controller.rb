class MealplanController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @mealplans = Mealplan.where(:customer_id => current_customer.id)
  end
  
  def new
    @mealplan = Mealplan.new
  end
  
  def edit
    @plan = Mealplan.find_by_id(params[:id])
    if @plan == nil
      flash[:error] = "Meal plan not found."
      redirect_back(fallback_location: :root)
    end
  end
  
  def update
    # @errors = Mealplan.update_mealplan_errors(params)
    # if @errors != ""
    #   flash[:error] = @errors
    # else
      Mealplan.fill(params, current_customer)
      flash[:success] = "Meal plan updated."
    # end
    redirect_to :mealplans
  end
  
  def delete
    @plan = Mealplan.find_by_id(params[:id])
    if @plan != nil
      @plan.destroy!
      flash[:success] = "Meal plan was deleted"
    else
      flash[:error] = "That plan cannot he found."
    end
    redirect_back(fallback_location: :root)
  end
  
  def save
    # @errors = Mealplan.save_mealplan_errors(params)
    # if @errors != ""
    #   flash[:error] = @errors
    # else
      # Mealplan.save_mealplan(params)
      Mealplan.fill(params, current_customer)
      flash[:success] = "Meal plan saved."
    # end
    redirect_to :mealplans
  end
  
  def bill_customers
    @mealplans = Customer.bill_customers
  end
end
