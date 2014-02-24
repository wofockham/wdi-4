# Comment
22 + 3 # Integer addition
'22' + '3' # String addition

locale = "world"

puts "Hello #{locale}" # FIXME: Remember to fix this

locale = "Spain"

brothers = ["Groucho", "Harpo", "Chico", "Zeppo"]

puts "Process ID: #{ Process.pid }"

if 15 < 3
  puts "15 is indeed less than 3"
elsif 15 < 20
  puts "15 is less than 20"
else
  puts "something else is going on"
end

score = 71
if score >= 80
  puts "A grade"
  puts "Congratulations!"
elsif score >= 70
  puts "B grade"
elsif score >= 60
  puts "C grade"
else
  puts "F"
end

brother = "Chico"
case brother
when "Groucho"
  puts "cigar"
when "Chico"
  puts "piano"
when "Harpo"
  puts "harp"
end

if true
  puts "That thing is true"
end

puts "Please enter a number: "
i = gets.chomp.to_i

puts "You entered: #{ i }. Thank you."
while i < 25
  puts "i is less than 25: #{ i }"
  i = i + 1
end

puts "i am always printed"

