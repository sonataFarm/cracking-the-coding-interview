class String
  def htmlEscapeSpaces
    i = self.length - 1
    j = self.length - 1

    while self[j] == ' '
      j -= 1
    end

    j.downto(0) do |j|
      if self[j] != ' '
        self[i] = self[j]
        i -= 1
      else
        self[i - 2..i] = '%20'
        i -= 3
      end
    end

    self
  end
end

puts 'a man a plan a canal panama            '.htmlEscapeSpaces