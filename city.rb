require 'open-uri'
require 'rest-client'
require 'json'

class City

	attr_accessor :city_name, :temp, :time

	def initialize
		@city_name = city_name
		@temp = temp
		@time = time
	end

	def get_wu_data
		
		get_city

		result = JSON.load(RestClient.get(wunderground_url))

		if result["current_observation"] == nil
			puts "I'm not familiar with '#{@city_name.capitalize}'. Move somewhere more well-known. Where are you now?" 
			get_wu_data
		else	
			@temp = result["current_observation"]["temp_c"]
			@time = result["current_observation"]["local_time_rfc822"]
		end	

	end

	def get_city

		@city_name = gets.chomp
	
	end

	def wunderground_url
		#Key: 30727dfc6902803f
		wunderground_url = "http://api.wunderground.com/api/30727dfc6902803f/conditions/q/uk/#{@city_name}.json"
	end

	def print_temp
		puts "The temperature in #{@city_name.capitalize} at #{@time} is #{@temp} degrees Celsius."
	end

end

#change