Rails.application.routes.draw do
  
  devise_for :customers
  resources :meals
  # resources :customer_meals
  match 'like', to: 'customer_meals#like', via: :post
  match 'unlike', to: 'customer_meals#unlike', via: :delete
  
  devise_for :chefs, :controllers => { :registrations => "chef/registrations" }
  root 'welcome#index'
  
  #mealplan controller
  # get 'plans/all', to: 'mealplan#plans', as: 'plans'
  # get 'plans/new_plan', to: 'mealplan#new_plan', as: 'new_plan'
  # get 'plans/edit_plan/:id', to: 'mealplan#edit_plan', as: 'edit_plan'
  # post 'plans/update_plan', to: 'mealplan#update_plan', as: 'update_plan'
  # post 'plans/save_plan', to: 'mealplan#save_plan', as: 'save_plan'
  # get 'plans/delete_plan/:id', to: 'mealplan#delete_plan', as: 'delete_plan'
  get 'mealplans/index', to: 'mealplan#index', as: 'mealplans'
  get 'mealplans/new', to: 'mealplan#new', as: 'new_mealplan'
  get 'mealplans/edit/:id', to: 'mealplan#edit', as: 'edit_mealplan'
  get 'mealplans/delete/:id', to: 'mealplan#delete', as: 'delete_mealplan'
  post 'mealplans/update', to: 'mealplan#update', as: 'update_mealplan'
  post 'mealplans/save', to: 'mealplan#save', as: 'save_mealplan'
end
