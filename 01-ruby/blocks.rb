nums = [1, 3, 5, 7, 11, 13, 17, 19, 23, 29]

i = 0
while i < nums.length
  puts "The prime number #{ nums[i] }"
  i += 1
end

puts i

nums.each do |n|
  puts "The prime number #{ n } via the .each method"
end

# while x = nums.shift
#   puts "The prime number #{ x }"
# end

kittens = "Buttons:Snowball:Fluffy:Mister Sinister:Craigsy".split ':'

nums.push "5"

kittens.each do |kitty|
  puts "The adorable #{ kitty }"
end

vices = {
  :groucho => 'cigars',
  :harpo => 'girls',
  :chico => 'pranks'
}

vices.each do |brother, vice|
  puts "We are looking at #{ brother }"
  puts "His vice is #{ vice }"
end

i = 0
while i < 12
  puts "beetlejuice"
  i += 1
end

12.times do |chunky_bacon|
  puts "beetlejuice!"
end

5.downto(1) do |n|
  puts n
end
puts "Blast off"

10.upto(23) do |j|
  puts "here is an interesting number: #{ j }"
end

candidates = (1..100).to_a
odds = candidates.map do |i|
  i.odd?
end

smalls = candidates.select do |j|
  j < 23
end
