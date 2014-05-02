ARGF.each do |line|
  if line =~ /guy/
    puts line.upcase
  end
end
