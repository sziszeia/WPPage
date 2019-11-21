class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :countryCode
      t.string :region
      t.string :incomeGroup
      t.string :specialNotes

      t.timestamps
    end
  end
end
