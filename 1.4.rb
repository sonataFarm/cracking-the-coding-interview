require 'pry'

def permutation_of_palindrome?(str)
  frequencies = Hash.new { |h, k| h[k] = 0 }
  
  str.split('').each do |c|
    frequencies[c.downcase] += 1 if letter?(c)
  end

  middle_letter_processed = false
  
  frequencies.each do |k, v|
    if v % 2 == 1
      return false if middle_letter_processed
      middle_letter_processed = true
    end
  end

  true
end

def letter?(char)
  !!char.match(/[A-Za-z]/)
end

puts permutation_of_palindrome?(ARGV[0])