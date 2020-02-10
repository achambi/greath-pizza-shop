class AddSlicesToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :slices, :integer
  end
end
