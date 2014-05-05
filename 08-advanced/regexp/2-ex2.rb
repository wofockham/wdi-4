ARGF.each do |line|
  if line =~ /\w+a\b/
    puts line
  end
end
