class AddReferencesToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :type_id, :integer
    add_column :orders, :cheese_id, :integer
    add_column :orders, :sauce_id, :integer
    add_column :orders, :crust_id, :integer

    add_foreign_key :orders, :pizza_types, column: :type_id
    add_foreign_key :orders, :options, column: :cheese_id
    add_foreign_key :orders, :options, column: :sauce_id
    add_foreign_key :orders, :options, column: :crust_id
  end
end
