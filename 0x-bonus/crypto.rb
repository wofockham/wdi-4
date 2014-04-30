require 'pp'
class Crypto
  def initialize(message)
    @message = message
  end

  def cipher_message
    segments = convert_segments(convert_plain_text)
    cipher(segments)
  end

  def decipher_message
    segments = convert_segments(@message)
    decipher(segments)
  end

  def convert_plain_text
    @message.split('').map(&:downcase).select do |character|
      /[a-z+]/ =~ character
    end
  end

  def convert_segments(characters)
    length = Math.sqrt(characters.length).ceil
    characters.each_slice(length).to_a
  end

  def cipher(segments)
    cipher_hash = []
    segments.each do |segment|
      segment.each_with_index do |letter, index|
        cipher_hash[index] ||= []
        cipher_hash[index] << letter
      end
    end
    cipher_hash.join('')
  end
end

puts Crypto.new("intrisfghnrsuliilhcosniikvbgntieuae").cipher_message
