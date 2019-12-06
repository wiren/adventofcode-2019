def nr_orbits(obj, hash)
  hash.has_key?(obj) ? 1 + nr_orbits(hash[obj], hash) : 0
end

h = File.open('input').map(&:chomp).map { |line| line.split(/\s*\)\s*/) }.each_with_object(Hash.new) do |orbit, hash|
  hash[orbit[1]] = orbit[0]
end

puts h.keys.map { |obj| nr_orbits(obj, h) }.reduce(&:+)
