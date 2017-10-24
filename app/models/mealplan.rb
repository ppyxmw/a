class Mealplan < ApplicationRecord
  belongs_to :customer

  def self.save_mealplan(params)
    self.fill(params)
  end

  def self.update_mealplan(params)
    self.fill(params)
  end
  
  def self.fill(params, current_customer)
    params = params["mealplan"]
    @mealplan = Mealplan.find_by_id(params["id"])
    
    if @mealplan == nil
      @mealplan = Mealplan.new
      @mealplan.customer = current_customer
    end
    
    self.rectify_errors(params)
    @mealplan.monday = params["monday"]
    @mealplan.tuesday = params["tuesday"]
    @mealplan.wednesday = params["wednesday"]
    @mealplan.thursday = params["thursday"]
    @mealplan.friday = params["friday"]
    @mealplan.saturday = params["saturday"]
    @mealplan.sunday = params["sunday"]
    @mealplan.state = "Active"    
    @mealplan.save
  end
  
  def self.rectify_errors(params)
    if !params["monday"].to_i.is_a? Integer then params["monday"] = 0 end
    if !params["tuesday"].to_i.is_a?  Integer then params["tuesday"] = 0 end
    if !params["wednesday"].to_i.is_a?  Integer then params["wednesday"] = 0 end
    if !params["thursday"].to_i.is_a?  Integer then params["thursday"] = 0 end
    if !params["friday"].to_i.is_a?  Integer then params["friday"] = 0 end
    if !params["saturday"].to_i.is_a?  Integer then params["saturday"] = 0 end
    if !params["sunday"].to_i.is_a?  Integer then params["sunday"] = 0 end
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