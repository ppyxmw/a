class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.references :customer, foreign_key: true
      t.datetime :due_date
      t.integer :prediction_range
      t.decimal :price
      t.string :currency
      t.string :currency_sign
      t.integer :no_meals
      t.boolean :paid
      t.boolean :fulfillable
      t.boolean :fulfilled
      t.string :payment_token

      t.timestamps
    end
  end
end
