class Customer::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_customer!

  def save
    
    current_customer.monday = params["customer"]["monday"].to_i
    current_customer.save
    debugger
  end
  
end