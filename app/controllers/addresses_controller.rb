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
        wants.xml  { render :xml => @address, :status => :created, :location => @address }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    flash[:danger] = "That address was successfully."
    redirect_to addresses_path
  end
  
    
  private
  def address_params
    params.require(:address).permit(:street, :city, :postcode, :details, :phone)
  end
end