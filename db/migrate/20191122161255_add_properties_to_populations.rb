class AddPropertiesToPopulations < ActiveRecord::Migration[5.2]
  def change
    add_column :populations, :countryName, :string
    add_column :populations, :countryCode, :string
    add_column :populations, :indicatorName, :string
    add_column :populations, :indicatorCode, :string
  end
end
