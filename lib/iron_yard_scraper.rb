# require 'rubygems'
require 'nokogiri'  
require 'open-uri'  

def create_location_hash
	html = open('http://theironyard.com/locations/')
	location_data = Nokogiri::HTML(html)
	locations = {}

	location_data.css('div.row').each do |area|
		city = area.css('h2').text.split(' ').join('-')
		locations[city] = {offerings: [], team: {}}
		area.css('li h4').each do |offering|
			locations[city][:offerings]<<offering.text
		end
		if area.css('h2').text == "London"
			city_html = open('https://www.ironyard.co.uk/')
		elsif area.css('h2').text == "Tampa Bay-St. Petersburg"
			city_html = open('http://theironyard.com/locations/tampa-st-petersburg/')
		elsif area.css('h2').text == "Washington, D.C."
			city_html = open('http://theironyard.com/locations/washington-dc/')
		else
		  city_html = open("http://theironyard.com/locations/#{city.to_s.downcase}/")
		end
		city_data = Nokogiri::HTML(city_html)
		city_data.css('div.photo-list').each do |people|
			locations[city][:team][people.css('h3').text] = people.css('h4').text
		end
		if locations[city][:team] == {}
			locations[city][:team] = "No team members listed at this time."
		end
	end
	locations.delete("")
	locations
end

