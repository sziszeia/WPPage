class UpdateOrderItemPropertyTypes < ActiveRecord::Migration[5.2]
  def change
    change_column :order_items, :order_id, :integer
    change_column :order_items, :product_id, :integer
    remove_column :order_items, :integer
  end
end
