require 'espeak'

include ESpeak

class Speaker

  def initialize(file)
    @file = file

    format_items
  end

  def convert_time_to_seconds(t)
    pattern = /^(?:(?:([01]?\d|2[0-3]):)?([0-5]?\d):)?([0-5]?\d)$/i
    if pattern =~ t
      hours, minutes, seconds = t.match(pattern).captures.map {|n| n.to_i}
      hours *= 3600
      minutes *= 60

      hours + minutes + seconds
    else
      raise 'Incorrect time format.'
    end
  end

  def format_items
    @items = @file.map do |time, message|
      {time: convert_time_to_seconds(time), message: Speech.new(message)}
    end
  end

  def speak
    second = 0

    until second > @items.last[:time]
      print "\r#{second} seconds elapsed"

      item = @items.select {|i| i[:time] == second}.first

      if item
        item[:message].speak
      end

      sleep(1)
      second += 1
    end
  end
end
