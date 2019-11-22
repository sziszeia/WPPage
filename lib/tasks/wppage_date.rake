require 'csv'

namespace :wppage do
  desc "This will read historical population data from the csv added to the assets and will add the data to the database."
  task seed_data: :environment do

    Country.destroy_all
    Indicator.destroy_all
    Population.destroy_all

    CSV.foreach("lib/assets/API_SP.POP.TOTL_DS2_en_csv_v2_422125/Metadata_Indicator_API_SP.POP.TOTL_DS2_en_csv_v2_422125.csv",
      encoding: "bom|utf-8",
      :headers => true) do |row|

        puts row.inspect #confirming the file's being read

        # create new model instances
        Indicator.create!(
          indicator_code: row[0],
          indicator_name: row[1],
          source_note: row[2]
        )
    end

    CSV.foreach("lib/assets/API_SP.POP.TOTL_DS2_en_csv_v2_422125/Metadata_Country_API_SP.POP.TOTL_DS2_en_csv_v2_422125.csv",
      encoding: "bom|utf-8",
      :headers => true) do |row|
      puts row.inspect #confirming the file's being read

      # create new model instances
      Country.create!(
      countryCode: row[0],
      region: row[1],
      incomeGroup: row[2],
      specialNotes: row[3]
      )
    end

    CSV.foreach("lib/assets/API_SP.POP.TOTL_DS2_en_csv_v2_422125/API_SP.POP.TOTL_DS2_en_csv_v2_422125.csv",
    encoding: "bom|utf-8",
    :headers => true).with_index do |row, i|

      # The csv file has a few rows out of interest for the app
      # they are skipped through until the first data row
      next if i <= 3
      
      country = Country.where(countryCode: row[1]).take
      if country
        puts country.countryCode
        puts country.id
      else
        puts "No data for country here"
      end

      indicator = Indicator.where(indicator_code: row[3]).take
      if indicator
        puts indicator.indicator_code
        puts indicator.id
      else
        puts "No data for indicator here"
      end

      puts row.inspect #confirming the file's being read

      # create new model instances
      u = Population.create!(
        # CountryName: row[0],
        # CountryCode: row[1],
        # IndicatorName: row[2],
        # IndicatorCode: row[3],
        Y2000: row[44],
        Y2001: row[45],
        Y2002: row[46],
        Y2003: row[47],
        Y2004: row[48],
        Y2005: row[49],
        Y2006: row[50],
        Y2007: row[51],
        Y2008: row[52],
        Y2009: row[53],
        Y2010: row[54],
        Y2011: row[55],
        Y2012: row[56],
        Y2013: row[57],
        Y2014: row[58],
        Y2015: row[59],
        Y2016: row[60],
        Y2017: row[61],
        Y2018: row[62],
        country_id: country&.id,
        indicator_id: indicator&.id
      )

      # Below could help identifying potential issues 
      puts u.valid?
      puts u.errors.messages
    end
  end
end
