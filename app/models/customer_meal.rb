class CustomerMeal < ActiveRecord::Base
  belongs_to :customer
  belongs_to :meal
  validates :customer_id, uniqueness: { scope: :meal_id }
end