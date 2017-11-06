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
  
  #admin controller
  get 'admin/index', to: 'admin#index', as: 'admin' 
  
   #admin invoices
  get '/admin/invoices', to: 'admin#invoices', as: 'admin_invoices'
  get '/admin/generate_invoices/:date', to: 'admin#generate_invoices', as: 'admin_generate_invoices'
  get '/admin/delete_invoice/:id', to: 'admin#delete_invoice', as: 'admin_delete_invoice'
  get '/admin/charge_invoice/:invoiceid', to: 'admin#charge_invoice', as: 'admin_charge_invoice'
  
  #admin mealplans
  get 'admin/mealplans', to: 'admin#mealplans', as: 'admin_mealplans'
  get 'admin/generate_n_ramdom_mealplans/:n', to: 'admin#generate_n_ramdom_mealplans', as: 'admin_generate_n_ramdom_mealplans'
  

end
