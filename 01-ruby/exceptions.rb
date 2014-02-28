require 'pry'

puts "welcome"

begin
  print "What do you want to divide by?"
  divisor = gets.to_i
  puts "the result of 3 divided by #{ divisor } is #{ 3 / divisor }"
rescue
  puts "That divisor is no good"
  retry
ensure
  puts "you will ALWAYS see this message"
end

puts "this code is about to explode"
raise "boom!"
