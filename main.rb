require_relative 'city.rb'

puts "It's hot out there. Tell me where you are, and I'll tell you how hot it is."

city = City.new
city.get_wu_data
city.print_temp