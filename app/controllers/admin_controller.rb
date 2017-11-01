class AdminController < ApplicationController
  def index
    # @no_mealplans = Mealplan.all.count
    # @no_customers = Customer.all.count
    # @no_chefs = Chef.all.count
    # @no_invoices = Invoice.all.count
  end

  def invoices
    @invoices = Invoice.all.order('date desc')
#     @no_invoices = @invoices.count
#     @date = DateTime.now.tomorrow.to_date    
  end

#   def delete_invoice
#     @id = params[:id]
#     Invoice.delete_invoice(@id)
#     flash[:success] = "Invoice with id "+ @id +" was deleted."
#     redirect_back(fallback_location: :admin)
#   end

#   def generate_invoices
#     @date = params[:date]
#     Invoice.generate_invoices_by_date(@date)
#     flash[:success] = "Invoices generated for " + @date + "."
#     redirect_back(fallback_location: :admin)
#   end

#   def chefs
#     @no_chefs = Chef.all.count
#   end

#   def generate_n_ramdom_chefs
#     @n = params[:n]
#     Chef.generate_n_ramdom_chefs(@n)
#     flash[:success] = @n.to_s + " chefs generated."
#     redirect_back(fallback_location: :admin)
#   end

  def mealplans
#     @no_mealplans = Mealplan.all.count
  end

  def generate_n_ramdom_mealplans
    @n = params[:n]
    Mealplan.generate_n_ramdom_mealplans(@n)
    flash[:success] = @n.to_s + " meal plans generated."
    redirect_back(fallback_location: :admin)
  end

#   def customers

#   end

#   def charge_invoice 
#     @invoice_id = params[:invoiceid]
#     @done = Invoice.charge_invoice(@invoice_id)
#     if @done == true then 
#       flash[:success] = "Invoice number " + @invoice_id.to_s + " charged."
#     else
#       flash[:success] = "Invoice wasn't charged."
#     end
#   end
end
