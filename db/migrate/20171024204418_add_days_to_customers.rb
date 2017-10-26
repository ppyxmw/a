class AddDaysToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :monday, :integer, :default => 0
    add_column :customers, :tuesday, :integer, :default => 0
    add_column :customers, :wednesday, :integer, :default => 0
    add_column :customers, :thursday, :integer, :default => 0
    add_column :customers, :friday, :integer, :default => 0
    add_column :customers, :saturday, :integer, :default => 0
    add_column :customers, :sunday, :integer, :default => 0
  end
end
