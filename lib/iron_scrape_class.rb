require_relative '../environment/environment.rb' 

class IronScrape

	def run(hash)
		@hash = hash
	  greeting
	  main_menu
	  response = gets.chomp
	  until response == "exit"
	    if response == 'list'
	  	  locations
	  	  space
	  	  main_menu
	  	  response = gets.chomp
	  	elsif city_matcher_array.include?(response)
	  		space
	  		puts "You choose #{response}!"
	  		space
	  		city_exploration(response)
	  		space
	  		main_menu
	  		response = gets.chomp
	  	else
	  		no_match
	  		space
	  		main_menu
	  		response = gets.chomp
	  	end
	  end
	  space
	  goodbye
	end

	def greeting
		puts "Welcome to Garett's first self-designed programming project. This interface scrapes off the Iron Yard website. Please choose from the following commands:"
	end

	def main_menu
		puts "1. Type 'list' to see all the locations of Iron Yard Bootcamps."
		puts "2. Type the name of the location that you wish to explore (as it appears in the list)."
		puts "3. Type 'exit' to leave the program."
		space
	end

	def no_match
		puts "Sorry! I don't recognize your request. Try again"
	end

	def locations
		@hash.keys.each do |city|
			puts city
		end
	end

	def goodbye
		puts "Thanks for using this program! Bye!"
	end

	def city_matcher_array
		@hash.keys
	end

	def space
		puts ''
	end

	def city_exploration(city_key)
		city_hash = @hash[city_key]
		subprogram = CityInfo.new(city_hash)
		subprogram.run
	end

end


