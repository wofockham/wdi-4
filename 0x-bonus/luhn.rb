class Luhn
  def initialize(number)
    @number = number
  end

  def checksum
    codes = []
    @number.to_s.reverse.split('').map(&:to_i).each_with_index do |n, i|
      n = n * 2 if i.odd?
      if n > 9
        n -= 9
      end
      codes << n
    end
    codes.inject(&:+)
  end

  # Per http://en.wikipedia.org/wiki/Luhn_algorithm
  def valid?
    self.checksum % 10 == 0
  end
end

class Fixnum
  def luhn_valid?
    Luhn.new(self).valid?
  end
end

puts Luhn.new(2323_2005_7766_3554).valid?
puts Luhn.new(2323_2005_7766_3547).valid?

puts 2323_2005_7766_3547.luhn_valid?