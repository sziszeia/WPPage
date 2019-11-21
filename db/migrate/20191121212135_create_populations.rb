class CreatePopulations < ActiveRecord::Migration[5.2]
  def change
    create_table :populations do |t|
      t.references :country, foreign_key: true
      t.references :indicator, foreign_key: true
      t.decimal :Y2000
      t.decimal :Y2001
      t.decimal :Y2002
      t.decimal :Y2003
      t.decimal :Y2004
      t.decimal :Y2005
      t.decimal :Y2006
      t.decimal :Y2007
      t.decimal :Y2008
      t.decimal :Y2009
      t.decimal :Y2010
      t.decimal :Y2011
      t.decimal :Y2012
      t.decimal :Y2013
      t.decimal :Y2014
      t.decimal :Y2015
      t.decimal :Y2016
      t.decimal :Y2017
      t.decimal :Y2018

      t.timestamps
    end
  end
end
