# Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string

def caesar_cipher(string, shift)
  result = ""
  string.each_char do |c|
    if c.ord.between?(65, 90)
      result += ((c.ord - 65 + shift) % 26 + 65).chr
    elsif c.ord.between?(97, 122)
      result += ((c.ord - 97 + shift) % 26 + 97).chr
    else
      result += c
    end
  end
  puts result
  result
end

caesar_cipher("What a string!", 5)