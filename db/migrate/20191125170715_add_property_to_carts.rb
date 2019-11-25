class AddPropertyToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :isCompleted, :boolean
  end
end
