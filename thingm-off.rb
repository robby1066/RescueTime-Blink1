#!/usr/bin/ruby

require 'blink1'

# CONVENIENCE SCRIPT TO TURN OFF THE STATUS LIGHT

Blink1.open do |blink1|
  blink1.off
end
