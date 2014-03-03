class Beer
  def self.song(num_bottles=99)
    if num_bottles < 1
      return
    end

    num_bottles.downto(2) do |i|
      puts "#{i} bottles of beer on the wall, #{i} bottles of beer,
Take one down and pass it around, #{i - 1} #{self.pluralize_bottles(i - 1) } of beer on the wall."
      puts ""
    end

    puts "1 bottle of beer on the wall, 1 bottle of beer,
Take it down and pass it around, no more bottles of beer on the wall.

No more bottles of beer on the wall, no more bottles of beer,
Go to the store and buy some more, #{num_bottles} bottles of beer on the wall."
    puts ""

  end

  def self.pluralize_bottles(n)
    n.abs == 1 ? 'bottle' : 'bottles'
  end
end

class Fixnum
  def bottles_of_beer
    Beer.song(self)
  end
end
