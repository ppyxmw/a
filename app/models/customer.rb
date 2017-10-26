class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :customer_meals
  has_many :meals, through: :customer_meals
  has_many :mealplans
  validates :monday, :inclusion => 0..3
  validates :tuesday, :inclusion => 0..3
  validates :wednesday, :inclusion => 0..3
  validates :thursday, :inclusion => 0..3
  validates :friday, :inclusion => 0..3
  validates :saturday, :inclusion => 0..3
  validates :sunday, :inclusion => 0..3
  
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
