class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.date :orderDate
      t.date :deliveryDate
      t.boolean :isComplete
      t.string :status
      t.boolean :isCancelled

      t.timestamps
    end
  end
end
