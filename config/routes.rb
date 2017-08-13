Rails.application.routes.draw do
  devise_for :customers
  resources :meals
  devise_for :chefs, :controllers => { :registrations => "chef/registrations" }
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
