class AddPhotoAndOtherDetailsToChefs < ActiveRecord::Migration[5.1]
  def change
    add_column :chefs, :name, :string
    add_column :chefs, :image, :string
    add_column :chefs, :description, :text
    add_column :chefs, :country, :string
    add_column :chefs, :address, :text
    add_column :chefs, :postcode, :string
    add_column :chefs, :contact_number, :string
    add_column :chefs, :bank_name, :string
    add_column :chefs, :bank_account_number, :integer
    add_column :chefs, :bank_sort_code, :integer
    add_column :chefs, :paypal_email, :string
  end
end
