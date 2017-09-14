Rails.application.routes.draw do
  devise_for :customers
  resources :meals
  # resources :customer_meals
  match 'like', to: 'customer_meals#like', via: :post
  match 'unlike', to: 'customer_meals#unlike', via: :delete
  
  devise_for :chefs, :controllers => { :registrations => "chef/registrations" }
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
