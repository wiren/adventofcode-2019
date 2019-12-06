def increasing(digits)
  (0 .. digits.size - 2).each do |i|
    if digits[i + 1] - digits[i] < 0
      return false
    end
  end
  true
end

def has_same_adjacent(digits)
  (0 .. digits.size - 2).each do |i|
    if digits[i + 1] == digits[i]
      return true
    end
  end
  false
end

def valid(pwd)
  digits = pwd.to_s.chars.map(&:to_i)
  increasing(digits) && has_same_adjacent(digits)
end

puts (235741..706948).select { |pwd| valid(pwd) }.size
