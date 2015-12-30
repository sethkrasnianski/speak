require 'espeak'

include ESpeak

# TODO
# - loop through file while timer is running and speak if looped time equals time in loop item's index

speech = Speech.new("works")
speech.speak
