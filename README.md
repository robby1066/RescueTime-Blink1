RescueTime-Blink1
=================

An example script to show how to use a Blink(1) Status Light do display your current RescueTime productivity pulse.

The productivity pulse is an average score of all the activities you've logged time for in RescueTime, based on the productivity levels that have been applied to them.

## To use this script

You will need to have Ruby on your system, and install the `blink1` gem - [Get it here](https://rubygems.org/gems/blink1)

1. Make a copy of the file `rescuetime_api_key_TEMPLATE.rb` and rename it to `rescuetime_api_key.rb`
2. In `rescuetime_api_key.rb`, update the `API_KEY` value to use a valid RescueTime API key - [More info](https://www.rescuetime.com/anapi/manage)
3. Plug in your Blink(1) Light if it's not already
4. In a terminal, call the `thingm-rescuetime.rb` script to update the Blink(1)'s color to reflect your current productivity pulse. (see 'polling the api' section below for more about continuous polling')

## Polling the API

Calling the `thingm-rescuetime.rb` script will update the light a single time. To have it run continuously, use your operating system's scheduling utility (Cron, for example), or open a terminal window and use a command like this:

`while true ; do ruby ~/Rails/thingm-rescuetime/rescuetime-chat-status.rb ; sleep 180 ; clear ; done`

When using this method, you can type `CTRL+c` to exit the loop, or just close the terminal window when you're done.

*NOTE: RescueTime updates at the MAXIMUM every three minutes, so it doesn't make any sense to poll more frequently than that.*

There is also a convenience script included - `thingm-off.rb` - to shut the light off.
