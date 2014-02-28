require 'pry'

puts "welcome"

begin
  result = 3 / 3
rescue
  result = 1 # Sane default
end

puts "The result is #{ result }"

puts "thank you for using this program"
