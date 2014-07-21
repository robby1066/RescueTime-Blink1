#!/usr/bin/ruby

require 'blink1'
require 'net/http'
require 'json'

# place your API_KEY definition in the file rescuetime_api_key.rb (.gitignored)
# you can get a RescueTime API key at
# https://www.rescuetime.com/anapi/manage
require './rescuetime_api_key.rb'

# USE A BLINK(1) STATUS LIGHT TO DISPLAY YOUR RESCUETIME PRODUCTIVITY PULSE
# https://www.rescuetime.com
# http://thingm.com/products/blink-1/

# WORKING EXAMPLE: https://www.youtube.com/watch?v=enRp7yfvl1U

API_KEY = RescueTime::API_KEY
API_ENDPOINT = 'https://www.rescuetime.com/anapi/current_productivity_pulse.json'

uri = URI.parse(API_ENDPOINT)

key = {:key => API_KEY}

uri.query = URI.encode_www_form(key)

http = Net::HTTP.new(uri.host, uri.port)

# uncomment if you're using ssl for the api endpoint
http.use_ssl = true

request = Net::HTTP::Get.new(uri.request_uri)
response = http.request(request)

response_json = JSON.parse(response.body)

if response_json['color'].nil?
  puts "no time logged, turning off light"
  Blink1.open do |blink1|
    blink1.off
  end
else
  puts "turn light to #{response_json['color']} to reflect the score of #{response_json['pulse']}"
  rgb = response_json['color'].match /#(..)(..)(..)/

  r = rgb[1].hex
  g = rgb[2].hex
  b = rgb[3].hex

  Blink1.open do |blink1|
    blink1.set_rgb(r, g, b)
  end

end
