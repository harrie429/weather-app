require 'yahoo_weatherman'

puts "Enter your Zip Code:"
location = gets.chomp

def get_location(location)
  client = Weatherman::Client.new
  client.lookup_by_location(location)
end

weather = get_location(location)

today = Time.now.strftime('%w').to_i

weather.forecasts.each do |forecast|

day = forecast['date']

weekday = day.strftime('%w').to_i

if weekday == today
  dayName = 'Today'
elsif weekday == today + 1
  dayName = 'Tomorrow'
else
  dayName = day.strftime('%A')
end


temp_high = forecast['high']

  if temp_high <= 14
      message = "#{dayName} is going to be really cold, bring a jacket"
    elsif temp_high >= 15 && 21
      message = "On #{dayName}, you might find it chilly, but long sleeves should be fine."
    elsif temp_high >= 22 && 28
      message = "On #{dayName}, you're going to find it comfortable outside, but don't go crazy."
    elsif temp_high >= 29 && 35
      message = "On #{dayName} it's going to be hot out.  You can still go out, but dress light"
    elsif temp_high >= 36
      message = "On #{dayName} don't even bother going out, it's too hot."
    else
      message = "Just don't go naked"
  end


puts dayName + ' is going to be ' + forecast['text'].downcase + ' with a low of ' +
forecast['low'].to_s + ' and a high of ' + forecast['high'].to_s
puts message

end
