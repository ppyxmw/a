class AddressesController < ApplicationController

  def index
    @addresses =  Address.where(:addressable_id => current_customer.mealplan.id, :addressable_type => "Mealplan").all
  end
  
  def new
    @address = Address.new
  end
  
  def edit
    @address = Address.find_by_id(params[:id])
  end
  
  def create
    @address = Address.new(address_params)
    @address.addressable = current_customer.mealplan
    respond_to do |wants|
      if @address.save
        flash[:notice] = 'Your address was successfully added.'
        wants.html { redirect_to root_path }
      else
        wants.html { render :action => "new" }
        flash[:notice] = 'blank saved'
      end
      @addresses =  Address.where(:addressable_id => current_customer.mealplan.id, :addressable_type => "Mealplan").all
      wants.js
    end
  end
  
  def update
    Address.update_address(params)
    flash[:success] = "Address updated."
    @addresses =  Address.where(:addressable_id => current_customer.mealplan.id, :addressable_type => "Mealplan").all
    respond_to do |wants|
      # wants.html { redirect_to addresses_path }
      wants.js
    end
  end
  
  def destroy
    @address = Address.destroy(params[:id])
    respond_to do |wants|
      wants.html { redirect_to root_path }
      wants.js
    end
  end
  
  private
  def address_params
    params.require(:address).permit(:street, :city, :postcode, :details, :phone)
  end
end