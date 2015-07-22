class CityInfo

	def initialize(city_hash)
		@city_hash = city_hash
	end

	def run
		city_menu
		response = gets.chomp.downcase
		until response == 'exit'
			case response 
			when 'offerings'
				space
				location_offerings
				space
				city_menu
				response = gets.chomp.downcase
			when 'team'
				space
				team_members
				space
				city_menu
				response = gets.chomp.downcase
			else
				slace
				no_match
				space
				city_menu
				response = gets.chomp.downcase
			end
		end
	end

	def city_menu
		puts "Please choose from the following options:"
		puts "1. Type 'offerings' to view what classes are offered at this location."
		puts "2. Type 'team' to review who works at the Iron Yard at this location."
		puts "3. Type 'exit' to return to the main menu."
		space
	end

	def space
		puts ''
	end

	def no_match
		puts "Sorry! I don't recognize your request. Try again"
	end

	def team_members
		@city_hash[:team].each do |name, position|
			puts "#{name} is the #{position}."
		end
	end

	def location_offerings
		@city_hash[:offerings].each do |offering|
			puts offering
		end
	end

end