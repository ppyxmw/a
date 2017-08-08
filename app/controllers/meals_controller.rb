class MealsController < ApplicationController
  
  def new
    @meal = Meal.new
    @chef = current_chef
  end
  
  def index
  end
  
  def create
    @meal = Meal.new(meal_params[:meal])
    respond_to do |wants|
      if @meal.save
        flash[:notice] = 'Your meal was successfully created.'
        wants.html { redirect_to(@meal) }
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
  
  private
    def meal_params
      params[:meal]["chef_id"] = current_chef.id
      params.require(:meal).permit(:name, :description, :chef_id)
    end
end
