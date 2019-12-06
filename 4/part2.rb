def increasing(digits)
  (0 .. digits.size - 2).each do |i|
    if digits[i + 1] - digits[i] < 0
      return false
    end
  end
  true
end

def has_freq_2(digits)
  counts = digits.each_with_object(Hash.new(0)) do |digit, hash|
    hash[digit] += 1
  end
  counts.has_value?(2)
end

def valid(pwd)
  digits = pwd.to_s.chars.map(&:to_i)
  increasing(digits) && has_freq_2(digits)
end

puts (235741..706948).select { |pwd| valid(pwd) }.size
