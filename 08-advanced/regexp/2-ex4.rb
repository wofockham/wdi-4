ARGF.each do |line|
  if m = line.match(/(?<word>\w+a)\b(?<extra>.{,5})/)
    puts "'#{m[:word]}' extra: #{m[:extra]}"
  end
end
