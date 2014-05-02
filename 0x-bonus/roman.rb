class Roman
  SYMBOL = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }

  def initialize(n)
    @number = n
  end

  def to_s
    m = @number
    s = ''
    until (m <= 0) do
      SYMBOL.each do |candidate, symbol|
        if (m / candidate >= 1)
          s += symbol
          m -= candidate
          break
        end
      end
    end
    s
  end
end

(1..3000).each do |n|
  puts Roman.new(n).to_s
end
