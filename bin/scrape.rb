#!/usr/bin/env ruby

require_relative '../config/environment.rb' 

iron_yard_location_hash = create_location_hash
joy = IronScrape.new
joy.run(iron_yard_location_hash)

