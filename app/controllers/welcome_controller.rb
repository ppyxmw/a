class WelcomeController < ApplicationController
  skip_before_action :authenticate_chef!, only: [:index]
  skip_before_action :authenticate_customer!, only: [:index]
  
  def index
    @meals = Meal.all
  end
end
