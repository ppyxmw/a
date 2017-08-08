class Meal < ActiveRecord::Base
    belongs_to :chef
    validates :name, presence: true, length: { minimum: 10, maximum: 40 } 
    validates :description, presence: true, length: { minimum: 10, maximum: 140 }
    validates :chef_id, presence: true
end