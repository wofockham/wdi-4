ARGF.each do |line|
  m = line.match (
    /(?<word>\w+a)      # a word ending in 'a'
      \b                # a word boundary
      (?<extra>.{,5})   # the next 5 characters (or fewer)
    /x)

  if m
    puts "'#{m[:word]}' extra: #{m[:extra]}"
  end
end
