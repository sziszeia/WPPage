class PopulationController < ApplicationController
    def populationHome
        # Get necessary data for the page from the db

            @countries = Country.all        
            @indicators = Indicator.all
            @populations = Population.all 

            # Chart setup       
            # Get country codes for the drop down
            @country_names = []

            @countries.each do |country|
                @country_names.push(country.countryCode)
            end 

            # Creating an array for data for years 2000 to 2018
            @years = []
            18.times do |i|
                @years.push(2000 + i)
            end

            # Populate @country with GBR as default or by passed in params
            if params[:SelectCountry1].blank?
                @country1 = @countries.where(countryCode: 'GBR').take
            else
                @country1 = @countries.where(countryCode: params[:SelectCountry1]).take
            end

            if params[:SelectCountry2].blank?
                @country2 = @countries.where(countryCode: 'GBR').take
            else
                @country2 = @countries.where(countryCode: params[:SelectCountry2]).take
            end

            # Once @country is known we need the associated population data and indicator
            @population1 = @populations.where(countryCode: @country1.countryCode).take
            @indicator1 = @indicators.where(indicator_code: @population1.indicatorCode).take

            @population2 = @populations.where(countryCode: @country2.countryCode).take
            @indicator2 = @indicators.where(indicator_code: @population2.indicatorCode).take

            # Get population per year for the selected country
            @annual_population1 = []
            @annual_population1.push(@population1.Y2000)
            @annual_population1.push(@population1.Y2001)
            @annual_population1.push(@population1.Y2002)
            @annual_population1.push(@population1.Y2003)
            @annual_population1.push(@population1.Y2004)
            @annual_population1.push(@population1.Y2005)
            @annual_population1.push(@population1.Y2006)
            @annual_population1.push(@population1.Y2007)
            @annual_population1.push(@population1.Y2008)
            @annual_population1.push(@population1.Y2009)
            @annual_population1.push(@population1.Y2010)
            @annual_population1.push(@population1.Y2011)
            @annual_population1.push(@population1.Y2012)
            @annual_population1.push(@population1.Y2013)
            @annual_population1.push(@population1.Y2014)
            @annual_population1.push(@population1.Y2015)
            @annual_population1.push(@population1.Y2016)
            @annual_population1.push(@population1.Y2017)
            @annual_population1.push(@population1.Y2018)

            @annual_population2 = []
            @annual_population2.push(@population2.Y2000)
            @annual_population2.push(@population2.Y2001)
            @annual_population2.push(@population2.Y2002)
            @annual_population2.push(@population2.Y2003)
            @annual_population2.push(@population2.Y2004)
            @annual_population2.push(@population2.Y2005)
            @annual_population2.push(@population2.Y2006)
            @annual_population2.push(@population2.Y2007)
            @annual_population2.push(@population2.Y2008)
            @annual_population2.push(@population2.Y2009)
            @annual_population2.push(@population2.Y2010)
            @annual_population2.push(@population2.Y2011)
            @annual_population2.push(@population2.Y2012)
            @annual_population2.push(@population2.Y2013)
            @annual_population2.push(@population2.Y2014)
            @annual_population2.push(@population2.Y2015)
            @annual_population2.push(@population2.Y2016)
            @annual_population2.push(@population2.Y2017)
            @annual_population2.push(@population2.Y2018)

    end
end
