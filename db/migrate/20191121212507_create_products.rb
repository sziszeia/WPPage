class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :pic
      t.decimal :price
      t.integer :quantity
      t.boolean :isNew
      t.boolean :isDiscounted
      t.string :type
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
