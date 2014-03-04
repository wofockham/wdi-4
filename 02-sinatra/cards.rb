class Card
  attr_accessor :suit, :value

  def initialize(value='Ace', suit=:hearts)
    @value = value
    @suit = suit
  end

  def to_s
    "#{value} of #{suit}"
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []

    suits = [:hearts, :clubs, :diamonds, :spades]
    values = [:ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king]
    suits.each do |suit|
      values.each do |value|
        @cards << Card.new(value, suit)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def deal(n=1)
    puts "Dealing #{n} cards..."
    @cards.slice!(0, n)
  end
end

class Player
  attr_accessor :name, :hand
  def initialize(name)
    @name = name
    @hand = []
  end

  def to_s
    "#{@name}: #{@hand.join(', ')}"
  end
end

# Creates and shuffles a new deck.
deck1 = Deck.new
deck1.shuffle
# Print cards to verify.
deck1.cards.each do |card|
  puts card
end

# Create some players and deal them some cards.
players = [Player.new('Hans'), Player.new('Bernard'), Player.new('Jonesy')]
players.each do |player|
  player.hand = deck1.deal 7
end

# Show each players hands.
players.each do |player|
  puts player
end
