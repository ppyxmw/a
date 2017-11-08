class MealsController < ApplicationController
  before_action :authenticate_chef!
  
  def new
    @meal = Meal.new
    @chef = current_chef
  end
  
  def index
    @meals = current_chef.meals.all
  end
  
  def create
    @meal = Meal.new(meal_params)
    @meal.chef = current_chef
    respond_to do |wants|
      if @meal.save
        wants.html { redirect_to meals_path }
        wants.xml  { render :xml => @meal, :status => :created, :location => @meal }
        wants.js {  flash.now[:notice] = "Succesfully created meal." }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @meal.errors, :status => :unprocessable_entity }
        # wants.js {  flash.now[:notice] = "Some things missing deleted meal." }
      end
    end
  end
  
  def show
     @meal = Meal.find(params[:id])
  end
  
  def destroy
    @meal = Meal.destroy(params[:id])
    respond_to do |wants|
      wants.html { redirect_to meals_path }
      wants.js {  flash.now[:danger] = "Succesfully deleted meal." }
    end
  end
  
  private
    def meal_params
      params.require(:meal).permit(:name, :description, :image)
    end
end
