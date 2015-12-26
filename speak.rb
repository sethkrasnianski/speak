require 'espeak'

include ESpeak

# TODO
# - create yaml file that declares times & messages
# - loop through file while timer is running and speak if looped time equals time in loop item's index

speech = Speech.new("works")
speech.speak
