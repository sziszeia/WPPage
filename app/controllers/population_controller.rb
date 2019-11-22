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
            if params[:SelectCountry].blank?
                @country = @countries.where(countryCode: 'GBR').take
            else
                @country = @countries.where(countryCode: params[:SelectCountry]).take
            end

            # Once @country is known we need the associated population data and indicator
            # @population = @populations.where(countryCode: @country.countryCode).take
            # @indicator = @indicators.where(indicator_code: @population.indicator_code).take
            @population = @populations.take

            # Get GDP per year for the selected country
            @annual_population = []
            @annual_population.push(@population.Y2000)
            @annual_population.push(@population.Y2001)
            @annual_population.push(@population.Y2002)
            @annual_population.push(@population.Y2003)
            @annual_population.push(@population.Y2004)
            @annual_population.push(@population.Y2005)
            @annual_population.push(@population.Y2006)
            @annual_population.push(@population.Y2007)
            @annual_population.push(@population.Y2008)
            @annual_population.push(@population.Y2009)
            @annual_population.push(@population.Y2010)
            @annual_population.push(@population.Y2011)
            @annual_population.push(@population.Y2012)
            @annual_population.push(@population.Y2013)
            @annual_population.push(@population.Y2014)
            @annual_population.push(@population.Y2015)
            @annual_population.push(@population.Y2016)
            @annual_population.push(@population.Y2017)
            @annual_population.push(@population.Y2018)

    end
end
