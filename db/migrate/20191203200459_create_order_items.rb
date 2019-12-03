class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.string :order_id
      t.string :integer
      t.string :product_id
      t.string :integer

      t.timestamps
    end
  end
end
