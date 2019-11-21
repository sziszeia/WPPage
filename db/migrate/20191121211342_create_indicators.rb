class CreateIndicators < ActiveRecord::Migration[5.2]
  def change
    create_table :indicators do |t|
      t.string :indicator_code
      t.string :indicator_name
      t.string :source_note

      t.timestamps
    end
  end
end
