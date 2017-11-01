class Mealplan < ApplicationRecord
  belongs_to :customer
  has_many :addresses, as: :addressable
  
  # def first_line
  #   Mealplan.address.street
  # end
  
# this is more for testing purposes or if you want for each customer to have a 
# default meal plan. You can generate one any time someone creates an account.
  def self.create_default(customer)
    @mealplan = Mealplan.new
    @mealplan.customer = customer
    @mealplan.monday = 0
    @mealplan.tuesday = 0
    @mealplan.wednesday = 0
    @mealplan.thursday = 0
    @mealplan.friday = 0
    @mealplan.saturday = 0
    @mealplan.sunday = 0
    @mealplan.state = "Active"
    @mealplan.save
    return @mealplan
  end

  # def self.get_plan(customer)
  #   if customer.mealplans.size == 0 then create_default(customer) end
  #   @plan = customer.mealplans.first
  #   return @plan
  # end

  def self.save_plan(params, current_user)
    #"Params " + params["mealplan"]["title"].to_s)
    @mealplan = params["mealplan"]
    @plan = Mealplan.new
    @plan.customer = current_user
    @plan.title = @mealplan["title"]
    @plan.sunday = @mealplan["sunday"]
    @plan.monday = @mealplan["monday"]
    @plan.tuesday = @mealplan["tuesday"]
    @plan.wednesday = @mealplan["wednesday"]
    @plan.thursday = @mealplan["thursday"]
    @plan.friday = @mealplan["friday"]
    @plan.saturday = @mealplan["saturday"]
    @plan.status = "Active"    
    @plan.save
    #Log.info(@plan.inspect)
  end

  def self.update_plan(params)
    #"Params " + params["mealplan"]["title"].to_s)
    @params = params
    @mealplan = Mealplan.find_by_id(@params["mealplan"]["id"])
    # if @plan != nil then 
	   # @plan.title = @mealplan["title"]
	    @mealplan.monday = @params["mealplan"]["monday"]
	    @mealplan.tuesday = @params["mealplan"]["tuesday"]
	    @mealplan.wednesday = @params["mealplan"]["wednesday"]
	    @mealplan.thursday = @params["mealplan"]["thursday"]
	    @mealplan.friday = @params["mealplan"]["friday"]
	    @mealplan.saturday = @params["mealplan"]["saturday"]
	    @mealplan.sunday = @params["mealplan"]["sunday"]
	    if  @params["monday_address"]
	      @mealplan.monday_address = @params["monday_address"]["address_id"].to_i
	    end
	    if  @params["tuesday_address"]
	      @mealplan.tuesday_address = @params["tuesday_address"]["address_id"].to_i
	    end
	    if  @params["wednesday_address"]
	      @mealplan.wednesday_address = @params["wednesday_address"]["address_id"].to_i
	    end
	    if  @params["thursday_address"]
	      @mealplan.thursday_address = @params["thursday_address"]["address_id"].to_i
	    end
	    if  @params["friday_address"]
	      @mealplan.friday_address = @params["friday_address"]["address_id"].to_i
	    end
	    if  @params["saturday_address"]
	      @mealplan.saturday_address = @params["saturday_address"]["address_id"].to_i
	    end
	    if  @params["sunday_address"]
	      @mealplan.sunday_address = @params["sunday_address"]["address_id"].to_i
	    end
	    @mealplan.state = "Active"    
	    @mealplan.save
	    
    # end
    #Log.info(@plan.inspect)
  end

  # def self.update_plan_errors(params)
  #   @errors = ""
  #   @mealplan = params["mealplan"]
  #   @title = @mealplan["title"]
  #   @monday = @mealplan["monday"]
  #   @tuesday = @mealplan["tuesday"]
  #   @wednesday = @mealplan["wednesday"]
  #   @thursday = @mealplan["thursday"]
  #   @friday = @mealplan["friday"]
  #   @saturday = @mealplan["saturday"]
  #   @sunday = @mealplan["sunday"]
  #   if @title == "" then @errors += "Title is empty." end
  #   if @monday == "" then @errors += "Monday is empty." end
  #   if @tuesday == "" then @errors += "Tuesday is empty." end
  #   if @wednesday == "" then @errors += "Wednesday is empty." end
  #   if @thursday == "" then @errors += "Thursday is empty." end
  #   if @friday == "" then @errors += "Friday is empty." end
  #   if @saturday == "" then @errors += "Saturday is empty." end
  #   if @sunday == "" then @errors += "Sunday is empty." end
  #   #add additional errors
  #   return @errors
  # end
  
  # def self.save_plan_errors(params)#checks common errors so the plan doesn't get saved badly
  #   @errors = ""
  #   @mealplan = params["mealplan"]
  #   @title = @mealplan["title"]
  #   @monday = @mealplan["monday"]
  #   @tuesday = @mealplan["tuesday"]
  #   @wednesday = @mealplan["wednesday"]
  #   @thursday = @mealplan["thursday"]
  #   @friday = @mealplan["friday"]
  #   @saturday = @mealplan["saturday"]
  #   @sunday = @mealplan["sunday"]
  #   if @title == "" then @errors += "Title is empty." end
  #   if @monday == "" then @errors += "Monday is empty." end
  #   if @tuesday == "" then @errors += "Tuesday is empty." end
  #   if @wednesday == "" then @errors += "Wednesday is empty." end
  #   if @thursday == "" then @errors += "Thursday is empty." end
  #   if @friday == "" then @errors += "Friday is empty." end
  #   if @saturday == "" then @errors += "Saturday is empty." end
  #   if @sunday == "" then @errors += "Sunday is empty." end
  #   #add additional errors
  #   return @errors
  # end


  # def self.get_mealplans_with_orders_by_wday(wday)#you give zero and you get all the customers who have meals sunday
  #   if wday == 0 then @mealplans = Mealplan.where("sunday > 0") end
  #   if wday == 1 then @mealplans = Mealplan.where("monday > 0") end
  #   if wday == 2 then @mealplans = Mealplan.where("tuesday > 0") end
  #   if wday == 3 then @mealplans = Mealplan.where("wednesday > 0") end
  #   if wday == 4 then @mealplanrs = Mealplan.where("thursday > 0") end
  #   if wday == 5 then @mealplans = Mealplan.where("friday > 0") end
  #   if wday == 6 then @mealplans = Mealplan.where("saturday > 0") end
  #   return @mealplans
  # end

  # def self.get_value_by_wday(mealplan, wday)#you retrieve how many meals a plan does have in any week day
  #   @value = 0
  #   if wday == 0 then @value = mealplan.sunday end
  #   if wday == 1 then @value = mealplan.monday end
  #   if wday == 2 then @value = mealplan.tuesday end
  #   if wday == 3 then @value = mealplan.wednesday end
  #   if wday == 4 then @value = mealplan.thursday end
  #   if wday == 5 then @value = mealplan.friday end
  #   if wday == 6 then @value = mealplan.saturday end
  #   return @value
  # end

  def self.generate_n_ramdom_mealplans(n)
    #destroy all customers and mealplans
    # Mealplan.all.destroy_all
    Customer.all.destroy_all
    #generate 100 customers, each with a meal plan and a random number of meals per day    
    for @i in (1..n.to_i) do
      @customer = Customer.new(email: @i.to_s + "@mail.com", password: "password")
      @customer.save
      @mealplan = Mealplan.create_default(@customer)
      @mealplan.monday = rand(10)
      @mealplan.tuesday = rand(10)
      @mealplan.wednesday = rand(10)
      @mealplan.thursday = rand(10)
      @mealplan.friday = rand(10)
      @mealplan.saturday = rand(10)
      @mealplan.sunday = rand(10)
      @mealplan.lat = 52.204266 + rand(-0.045..0.045)
      @mealplan.long = 0.119907 + rand(-0.045..0.045)
      @mealplan.state = "Active"
      @mealplan.save
    end
  end
end