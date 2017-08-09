class Meal < ActiveRecord::Base
  belongs_to :chef
  mount_uploader :image, ImageUploader
  validates :name, presence: true, length: { minimum: 10, maximum: 40 } 
  validates :description, presence: true, length: { minimum: 10, maximum: 140 }
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