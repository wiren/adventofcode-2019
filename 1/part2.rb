def sum_fuel(fuel_need, n)
  nxt = n / 3 - 2
  nxt <= 0 ? fuel_need : sum_fuel(fuel_need + nxt, nxt)
end

puts File.open('input')
         .map { |n| sum_fuel(0, n.to_i)  }
         .reduce(&:+)
