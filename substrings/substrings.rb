# Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found. Make sure your method can handle multiple words.

def substrings(string, dictionary)
  string = string.downcase
  dictionary = dictionary.map(&:downcase)

  result = Hash.new(0)

  dictionary.each do |word|
    result[word] = string.scan(word).size if string.include?(word)
  end
  
  puts result
  return result
end

test_dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Howdy partner, sit down! How's it going?", test_dictionary)