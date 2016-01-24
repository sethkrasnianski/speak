require 'yaml'
require_relative 'speaker'


file = YAML.load_file('starcraft.yml')

speaker = Speaker.new(file)
speaker.speak
