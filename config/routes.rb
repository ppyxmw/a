Rails.application.routes.draw do
  devise_for :customers
  resources :meals
  # resources :customer_meals
  match 'like', to: 'customer_meals#like', via: :post
  match 'unlike', to: 'customer_meals#unlike', via: :delete
  
  devise_for :chefs, :controllers => { :registrations => "chef/registrations" }
  root 'welcome#index'
  
  get 'mymealplan', to: 'mealplan#show', as: 'mymealplan'
  post 'mymealplan/update', to: 'mealplan#update', as: 'update_mymealplan'

  resources :addresses

end
