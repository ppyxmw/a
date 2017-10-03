class Chef < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :meals
  mount_uploader :image, ImageUploader
  validates :description, presence: true, length: { minimum: 50, maximum: 140 }
    
end
