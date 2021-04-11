def one_edit_away?(a, b)
  length_diff = (a.length - b.length).abs

  return false if length_diff > 1

  if length_diff == 1
    # test for insert / remove
    smaller = a.length < b.length ? a : b
    bigger = a.length > b.length ? a : b

    edit_found = false
    i, j = 0, 0

    while i < smaller.length do
      if smaller[i] != bigger[j]
        return false if edit_found
        edit_found = true
        j += 1
      else
        i += 1
        j += 1
      end
    end
  else
    # process replace
    edit_found = false
    a.split('').each_with_index do |c, idx|
      if b[idx] != c
        return false if edit_found
        edit_found = true
      end
    end
  end

  true
end

puts one_edit_away?(ARGV[0], ARGV[1])