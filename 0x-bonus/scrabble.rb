class Scrabble

  letters = {
    1 => %w(A E I O U L N R S T),
    2 => %w(D G),
    3 => %w(B C M P),
    4 => %w(F H V W Y),
    5 => %w(K),
    8 => %w(J X),
    10 => %w(Q Z)
  }

  @@points = {}

  # Invert the letters hash to use each letter as a key and points as value.
  letters.each do |value, candidates|
    candidates.each do |letter|
      @@points[letter] = value
    end
  end

  def self.score(word)
    # Score each letter in the word and return the score.
    score = 0
    word.split('').each do |letter|
      if @@points[letter.upcase]
        score += @@points[letter.upcase]
      end
    end
    score
  end
end

puts Scrabble.score("cabbage") # => 14
puts Scrabble.score("two words")