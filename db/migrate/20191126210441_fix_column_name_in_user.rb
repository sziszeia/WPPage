class FixColumnNameInUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :type, :userType
  end
end
