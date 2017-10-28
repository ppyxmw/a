class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :postcode
      t.string :details
      t.string :phone
      t.integer :addressable_id   #foreign key
      t.string  :addressable_type #type
      t.references :addressable, polymorphic: true, index: true
      
      t.timestamps
    end
  end
end
