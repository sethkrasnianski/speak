require 'espeak'

include ESpeak

class Speaker

  def initialize(file)
    @file = file

    format_items
  end

  def convert_time_to_seconds(t)
    hours, minutes, seconds = t.match(/(^.*)(:)(.*)(:)(.*)/i).captures.reject! {|n| n == ':'}.map {|n| n.to_i}
    hours *= 3600
    minutes *= 60

    hours + minutes + seconds
  end

  def format_items
    @items = @file.map do |time, message|
      {time: convert_time_to_seconds(time), message: Speech.new(message)}
    end
  end

  def speak
    second = 0

    until second > @items.last[:time]
      item = @items.select {|i| i[:time] == second}.first

      if item
        item[:message].speak
      end

      sleep(1)
      second += 1
    end
  end
end