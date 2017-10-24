class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :customer_meals
  has_many :meals, through: :customer_meals
  has_many :mealplans
  
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
end
