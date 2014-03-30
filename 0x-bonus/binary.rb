
class Binary
  def initialize(str)
    @bits = str.split('')
    raise "Not a binary string" unless @bits.all? { |bit| bit == '0' || bit == '1' }
  end

  def to_i
    exponent = 0
    result = 0
    @bits.reverse.each do |bit|
      result += (2 ** exponent) if bit == '1'
      exponent += 1
    end
    result
  end
end

b = Binary.new('1001')
puts b.to_i # => 9

b2 = Binary.new('111')
puts b2.to_i # => 7

b3 = Binary.new('71000011010101010111110000110101010101011100000111010010101')
puts b3.to_i
