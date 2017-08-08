class WelcomeController < ApplicationController
  skip_before_action :authenticate_chef!, only: [:index]
  def index
  end
end
