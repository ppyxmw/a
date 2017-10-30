class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  
  validates :street, length: { in: 6..35 }
  validates :city, length: { in: 6..20 }
  validates :postcode, length: { in: 5..7 }
  validates :details, length: { in: 0..145 }
  validates :phone, length: { in: 10..14 }
  
  def first_line
    "#{street.truncate(16)}"
  end
  
  def self.update_address(params)
    @address = Address.find_by_id(params[:id])
    @address.street = params["address"]["street"]
    @address.city = params["address"]["city"]
    @address.postcode = params["address"]["postcode"]
    @address.details = params["address"]["details"]
    @address.phone = params["address"]["phone"]
    @address.save
  end
end