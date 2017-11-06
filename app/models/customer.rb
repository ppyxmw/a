class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :customer_meals, :dependent => :destroy
  has_many :meals, through: :customer_meals
  has_one :mealplan, :dependent => :destroy

  
  # creates a new heart row with post_id and user_id
  def like(meal)
    self.customer_meals.create!(meal_id: meal.id)
  end
  
  # destroys a heart with matching post_id and user_id
  def unlike(meal)
    like = self.customer_meals.find_by_meal_id(meal.id)
    like.destroy!
  end
  
  #returns true or false if a post is hearted by user
  def like?(meal)
    self.customer_meals.find_by_meal_id(meal.id)
  end
  
  
  
  # def self.pay_bill(user, price) #bills a customer a certain price
  #   #Stripe.api_key = "sk_test_F3VxNGCiFEQUidNKtz1wSrpb"
  #   @customer = nil
  #   if user.stripeid == nil then
  #   @customer = Stripe::Customer.create(#it creates a customer object remotely in stripe
  #     :email => user.email,
  #     :source  => "tok_mastercard"
  #   )
  #   user.stripeid = @customer.id#it saves the customer id from stripe in the database, in the field stripeid
  #   user.save
  #   else
  #     @customer = Stripe::Customer.retrieve(user.stripeid)      #it retrieves a customer remotely from stripe with the help of the stripeid saved in the db
  #   end
  #   @customer.sources.create(source: "tok_mastercard")  #it creates a dummy mastercard. This is for testing purposes only. In production, I don't think you will have direct access to customer's credit card info.    

  #   charge = Stripe::Charge.create(#it charges the customer
  #     :amount => price * 100,#the amount is in pence(p) so the rounded amount like for example £10 needs to be multipled by 100
  #     :currency => "GBP", #if you don't specify this, stripe will assume USD. I think it depends to what currency you set remotely on dashboard stripe.
  #     :customer => user.stripeid.to_s,
  #     #:source => "tok_mastercard", # obtained with Stripe.js
  #     :description => "Charge for " + user.email.to_s
  #   )

  # end


  # def self.bill_customers #bills all customers for tomorrow's charge
  #   @wday = (Time.now + 1.day).wday
  #   @mealplans = Mealplan.get_mealplans_with_orders_by_wday(@wday)
  #   for @mealplan in @mealplans do
  #     @price = Mealplan.get_value_by_wday(@mealplan, @wday) * 6
  #     @customer = @mealplan.customer
  #     Customer.pay_bill(@customer, @price)
  #   end    
  # end

  # def self.get_next_charge_value(customer)#It determines how much the customer needs to pay tomorrow.
  #   @amount = 0
  #   @plan = Mealplan.where(:customer => customer).first
  #   if @plan != nil then
  #     @wday = (Time.now + 1.day).wday
  #     @nr_meals = Mealplan.get_value_by_wday(@plan, @wday) 
  #     @amount = @nr_meals * 6
  #   end
  #   return @amount
  # end

  # def self.seed_customers(n)
  #   for @i in (1..n) do
  #     Customer.create!(email: @i.to_s+'@gmail', password: 'admin100', confirmed_at: '2017-10-16 20:30:41.395277', confirmation_sent_at: '2017-10-16 20:30:41.395277')
  #     if @i % 10 == 0 then puts @i.to_s + "customers created." end
  #   end
  # end

  # def self.create_customer_on_stripe(customer_id)
  #   @customer = Customer.find_by_id(customer_id)
  #   @stripeid = ""
  #   if @customer != nil then 
  #   if @customer.stripeid == nil or @customer.stripeid == "" then 
  #     @stripe_customer = Stripe::Customer.create(
  #       :description => @customer.email.to_s,
  #       :source => "tok_mastercard" # obtained with Stripe.js
  #     )
  #     @customer.stripeid = @stripe_customer.id
  #     @customer.save      
  #     @stripeid = @stripe_customer.id
  #   else
  #     @stripeid = @customer.stripeid
  #   end     
  #   end    
  #   return @stripeid
  # end

end
