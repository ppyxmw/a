class ApplicationController < ActionController::Base
  before_action :authenticate_chef!
  protect_from_forgery with: :exception
end
