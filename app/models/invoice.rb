class Invoice < ApplicationRecord
  belongs_to :customer

  def self.get_weekday_by_date(date)
    @weekday = ""
    @new_date = Date.parse(date)
    @weekday = @new_date.strftime("%A").downcase
    return @weekday
  end

  def self.get_mealplan_value_by_weekday(mealplan, weekday)
    @value = ""
    if weekday == "monday" then @value = mealplan.monday end
    if weekday == "tuesday" then @value = mealplan.tuesday end
    if weekday == "wednesday" then @value = mealplan.wednesday end
    if weekday == "thursday" then @value = mealplan.thursday end
    if weekday == "friday" then @value = mealplan.friday end
    if weekday == "saturday" then @value = mealplan.saturday end
    if weekday == "sunday" then @value = mealplan.sunday end
    return @value
  end

  def self.generate_invoices_by_date(date)
    @weekday = get_weekday_by_date(date).to_s
    @mealplans = Mealplan.where(@weekday + " > 0")
    for @mealplan in @mealplans do
      @invoice = Invoice.new
      @invoice.customer = @mealplan.customer
    	@invoice.due_date = date
    	@invoice.prediction_range = (Date.parse(date) - Date.today).to_i
    	@invoice.no_meals = get_mealplan_value_by_weekday(@mealplan, @weekday)
    	@invoice.paid = false
      @invoice.save
    end
  end

  def self.delete_invoice(id)
    @invoice = Invoice.find_by_id(id)
    if @invoice != nil then
      @invoice.destroy
    end
  end

  def self.charge_invoice(id)
    @invoice = Invoice.find_by_id(id)
    @done = false
    if @invoice != nil 
      @customer = @invoice.customer
      #get number of meals for the day
      @no_meals = @invoice.no_meals
      @price = @no_meals.to_i * 5.99
    #   Customer.pay_bill(@customer, @price)
    #   @invoice.paid = true
    #   @invoice.save
    end
    # return @done
  end
end
