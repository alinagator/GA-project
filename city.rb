require 'open-uri'
require 'rest-client'
require 'json'

class City

	attr_accessor :city_name, :temp, :time

	def check_weather
		@city_name = get_city

		result = JSON.load(RestClient.get(wunderground_url))

		if result["current_observation"] == nil
			puts "I'm not familiar with '#{@city_name.capitalize}'. Move somewhere more well-known. Where are you now?" 
			check_weather # Do it again
		else	
			@temp = result["current_observation"]["temp_c"]
			@time = result["current_observation"]["local_time_rfc822"]
		end	
	end

	def get_city
		gets.chomp
	end

	def wunderground_url
		#Key: 30727dfc6902803f
		wunderground_url = "http://api.wunderground.com/api/30727dfc6902803f/conditions/q/uk/#{@city_name}.json"
	end

	def print_temp
		puts "The temperature in #{@city_name.capitalize} on #{@time} is #{@temp} degrees Celsius."
	end

end
