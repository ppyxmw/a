class Meal < ActiveRecord::Base
  belongs_to :chef
  has_many :customer_meals
  has_many :customers, through: :customer_meals
  
  mount_uploader :image, ImageUploader
  validates :description, presence: true, length: { minimum: 30, maximum: 125 }
  validates :chef_id, presence: true
  validates :image, presence: true
  validate :image_size
  
  private

  def image_size
    if image.size > 5.megabytes
      errors.add(:image, "should be less than 5MB")
    end
  end
end