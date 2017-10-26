class Mealplan < ApplicationRecord
  belongs_to :customer

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
    return @mealplan.id
  end

  def self.get_plan(customer)
    if customer.mealplans.size == 0 then create_default(customer) end
    @plan = customer.mealplans.first
    return @plan
  end

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
    @params = params["mealplan"]
    @mealplan = Mealplan.find_by_id(@params["id"])
    # if @plan != nil then 
	   # @plan.title = @mealplan["title"]
	    @mealplan.monday = @params["monday"]
	    @mealplan.tuesday = @params["tuesday"]
	    @mealplan.wednesday = @params["wednesday"]
	    @mealplan.thursday = @params["thursday"]
	    @mealplan.friday = @params["friday"]
	    @mealplan.saturday = @params["saturday"]
	    @mealplan.sunday = @params["sunday"]
	    @mealplan.state = "Active"    
	    @mealplan.save
	    
    # end
    #Log.info(@plan.inspect)
  end

  def self.update_plan_errors(params)
    @errors = ""
    @mealplan = params["mealplan"]
    @title = @mealplan["title"]
    @monday = @mealplan["monday"]
    @tuesday = @mealplan["tuesday"]
    @wednesday = @mealplan["wednesday"]
    @thursday = @mealplan["thursday"]
    @friday = @mealplan["friday"]
    @saturday = @mealplan["saturday"]
    @sunday = @mealplan["sunday"]
    if @title == "" then @errors += "Title is empty." end
    if @monday == "" then @errors += "Monday is empty." end
    if @tuesday == "" then @errors += "Tuesday is empty." end
    if @wednesday == "" then @errors += "Wednesday is empty." end
    if @thursday == "" then @errors += "Thursday is empty." end
    if @friday == "" then @errors += "Friday is empty." end
    if @saturday == "" then @errors += "Saturday is empty." end
    if @sunday == "" then @errors += "Sunday is empty." end
    #add additional errors
    return @errors
  end
  
  def self.save_plan_errors(params)#checks common errors so the plan doesn't get saved badly
    @errors = ""
    @mealplan = params["mealplan"]
    @title = @mealplan["title"]
    @monday = @mealplan["monday"]
    @tuesday = @mealplan["tuesday"]
    @wednesday = @mealplan["wednesday"]
    @thursday = @mealplan["thursday"]
    @friday = @mealplan["friday"]
    @saturday = @mealplan["saturday"]
    @sunday = @mealplan["sunday"]
    if @title == "" then @errors += "Title is empty." end
    if @monday == "" then @errors += "Monday is empty." end
    if @tuesday == "" then @errors += "Tuesday is empty." end
    if @wednesday == "" then @errors += "Wednesday is empty." end
    if @thursday == "" then @errors += "Thursday is empty." end
    if @friday == "" then @errors += "Friday is empty." end
    if @saturday == "" then @errors += "Saturday is empty." end
    if @sunday == "" then @errors += "Sunday is empty." end
    #add additional errors
    return @errors
  end


  def self.get_mealplans_with_orders_by_wday(wday)#you give zero and you get all the customers who have meals sunday
    if wday == 0 then @mealplans = Mealplan.where("sunday > 0") end
    if wday == 1 then @mealplans = Mealplan.where("monday > 0") end
    if wday == 2 then @mealplans = Mealplan.where("tuesday > 0") end
    if wday == 3 then @mealplans = Mealplan.where("wednesday > 0") end
    if wday == 4 then @mealplans = Mealplan.where("thursday > 0") end
    if wday == 5 then @mealplans = Mealplan.where("friday > 0") end
    if wday == 6 then @mealplans = Mealplan.where("saturday > 0") end
    return @mealplans
  end

  def self.get_value_by_wday(mealplan, wday)#you retrieve how many meals a plan does have in any week day
    @value = 0
    if wday == 0 then @value = mealplan.sunday end
    if wday == 1 then @value = mealplan.monday end
    if wday == 2 then @value = mealplan.tuesday end
    if wday == 3 then @value = mealplan.wednesday end
    if wday == 4 then @value = mealplan.thursday end
    if wday == 5 then @value = mealplan.friday end
    if wday == 6 then @value = mealplan.saturday end
    return @value
  end

  def self.generate_n_ramdom_mealplans(n)
    #destroy all existing mealplans now
    Mealplan.all.destroy_all
    #generate a random customer    
    for @i in (1..n.to_i) do
      @customer = Customer.order("RANDOM()").limit(10).first
      @mealplan = Mealplan.new
      @mealplan.customer = @customer
      @mealplan.sunday = rand(10)
      @mealplan.monday = rand(10)
      @mealplan.tuesday = rand(10)
      @mealplan.wednesday = rand(10)
      @mealplan.thursday = rand(10)
      @mealplan.friday = rand(10)
      @mealplan.saturday = rand(10)
      @mealplan.state = "Active"
      @mealplan.save
    end
  end
end
