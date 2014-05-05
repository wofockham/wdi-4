ARGF.each do |line|
  if m = line =~ /(\w+a)\b/
    puts "'#{$1}'"
  end
end
