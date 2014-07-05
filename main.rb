require_relative 'city.rb'


def welcome
	puts "It's hot out there. Tell me where you are, and I'll tell you how hot it is."
	create_city
end

def create_city
	city = City.new
	city.print_temp

	puts "Want to know the temperature somewhere else?"
	more_weather = gets.chomp.upcase

	until (more_weather == "Y" or more_weather == "N")
      puts "Please enter 'Y' or 'N'"
      more_weather = gets.chomp.upcase
    end

    if more_weather == "Y"
    	puts "Enter a new city."
    	create_city
 	end

    if more_weather == "N"
    	puts "Great. Get outside and enjoy the weather!"	
    end
end

welcome
