class WelcomeController < ApplicationController
  skip_before_action :authenticate_chef!, only: [:index]
  
  def index
    @meals = Meal.all
  end
end
