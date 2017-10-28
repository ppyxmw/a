class AddressesController < ApplicationController

  def index
    @addresses = current_customer.addresses.all
  end
  
  def new
    @address = Address.new
  end
  
  def create
    @address = Address.new(address_params)
    @address.addressable = current_customer.mealplan
    respond_to do |wants|
      if @address.save
        flash[:notice] = 'Your address was successfully added.'
        wants.html { redirect_to root_path }
        wants.xml  { render :xml => @address, :status => :created, :location => @address }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end
    
  private
  def address_params
    params.require(:address).permit(:street, :city, :postcode, :details, :phone)
  end
end