class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :userName
      t.string :password
      t.string :type

      t.timestamps
    end
  end
end
