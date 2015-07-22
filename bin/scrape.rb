#!/usr/bin/env ruby
require_relative '../lib/iron_yard_location_data'
require_relative '../lib/iron_yard_scraper'

iron_yard_location_hash = create_location_hash
joy = IronScrape.new
joy.run(iron_yard_location_hash)

