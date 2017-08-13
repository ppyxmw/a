class MealsController < ApplicationController
  
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
        flash[:notice] = 'Your meal was successfully created.'
        wants.html { redirect_to meals_path }
        wants.xml  { render :xml => @meal, :status => :created, :location => @meal }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @meal.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show
     @meal = Meal.find(params[:id])
  end
  
  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
    flash[:danger] = "That meal was successfully deleted."
    redirect_to meals_path
  end
  
  
  private
    def meal_params
      params.require(:meal).permit(:name, :description, :image)
    end
end
