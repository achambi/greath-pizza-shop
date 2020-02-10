class AddStatusToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :status_id, :integer

    add_foreign_key :orders, :statuses, column: :status_id
  end
end
