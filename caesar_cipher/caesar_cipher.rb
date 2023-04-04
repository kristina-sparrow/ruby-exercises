# Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string

def caesar_cipher(string, shift)
  string.each_char do |c|
    if c.ord.between?(65, 90)
      print ((c.ord - 65 + shift) % 26 + 65).chr
    elsif c.ord.between?(97, 122)
      print ((c.ord - 97 + shift) % 26 + 97).chr
    else
      print c
    end
  end
end

caesar_cipher("What a string!", 5)